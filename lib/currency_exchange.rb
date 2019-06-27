require 'json'
require 'date'

class CurrencyExchange
    def self.rate(date, from_currency, to_currency)
      hash = parse_file[date.strftime]
      if to_currency == "EUR"
        hash.default = 1
      end
      hash[to_currency] / hash[from_currency]
    end

    def self.parse_file
      JSON.parse(File.read(file_name))
    end

    def self.file_name
      'data/eurofxref-hist-90d.json'
    end
end

class CurrencyError < StandardError
end

class DateError < StandardError
end
