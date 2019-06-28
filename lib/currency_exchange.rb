require 'json'
require 'date'

class CurrencyExchange

  FILE_NAME = 'data/eurofxref-hist-90d.json'

    def self.rate(date:, from:, to:)
      fx_rates = fx_dates.fetch(date.strftime) { raise DateError }
      from_rate = fx_rates.fetch(from) { raise CurrencyError }
      numerator = to == "EUR" ? 1 : fx_rates.fetch(to) { raise CurrencyError }
      numerator / from_rate
    end

    def self.fx_dates
      JSON.parse(File.read(FILE_NAME))
    end
end

class CurrencyError < StandardError
  def message
    "Error - unable to calculate rate requested"
  end
end

class DateError < StandardError
  def message
  "Error - no rate at date found"
  end
end