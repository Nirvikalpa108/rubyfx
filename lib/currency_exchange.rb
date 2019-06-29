require 'json'
require 'date'

class CurrencyExchange

  FILE_NAME = 'data/eurofxref-hist-90d.json'
  BASE_RATE = 'EUR'

    def self.rate(date:, from:, to:)
      to_currency(date, to) / from_currency(date, from)
    end

    private
    def self.to_currency(date, to)
      if to == BASE_RATE
        return 1
      else
        date_convert(date).fetch(to) { raise CurrencyError }
      end
    end
  
    def self.from_currency(date, from)
      date_convert(date).fetch(from) { raise CurrencyError }
    end

    def self.date_convert(date)
      fx_dates.fetch(date.strftime) { raise DateError }
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