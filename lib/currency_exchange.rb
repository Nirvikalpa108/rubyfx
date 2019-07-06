require 'json'
require 'csv'
require 'date'

class CurrencyExchange

  BASE_RATE = 'EUR'

    def self.rate(date:, from:, to:, fx_filepath:)
      fx_filepath
      to_currency(date, to) / from_currency(date, from)
    end

    private
    def self.fx_dates(fx_filepath)
      if File.extname(fx_filepath) == ".json"
        JSON.parse(File.read(fx_filepath))
      elsif File.extname(fx_filepath) == ".csv"
        CSV.parse(File.read(fx_filepath))
        else raise FileError
      end
    end

    def self.date_convert(date)
      fx_dates.fetch(date.strftime) { raise DateError }
    end

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

class FileError < StandardError
  def message
    "Error - this file type is not accepted. Try JSON or CSV."
  end
end
