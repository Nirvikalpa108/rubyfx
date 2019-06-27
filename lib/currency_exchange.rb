require 'json'
require 'date'

class CurrencyExchange

  FILE_NAME = 'data/eurofxref-hist-90d.json'

    def self.rate(date:, from:, to:)
      fx_rates = fx_dates[date.strftime]
      numerator = to == "EUR" ? 1 : fx_rates[to]
      numerator / fx_rates[from]
    end

    def self.fx_dates
      JSON.parse(File.read(FILE_NAME))
    end
end

class CurrencyError < StandardError; end
class DateError < StandardError; end
