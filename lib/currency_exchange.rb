require 'json'
require 'date'

class CurrencyExchange

  FILE_NAME = 'data/eurofxref-hist-90d.json'

    def self.rate(date:, from:, to:)
      hash = parse_file[date.strftime]
      if to == "EUR"
        hash.default = 1
      end
      hash[to] / hash[from]
    end

    def self.parse_file
      JSON.parse(File.read(FILE_NAME))
    end
end

class CurrencyError < StandardError; end
class DateError < StandardError; end
