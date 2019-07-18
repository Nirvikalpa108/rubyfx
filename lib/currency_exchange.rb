require 'json'
require 'csv'
require 'date'

class CurrencyExchange

  BASE_RATE = 'EUR'

    def self.rate(date:, from:, to:, file:)
      to_currency(file, date, to) / from_currency(file, date, from)
    end

    private
    def self.fx_dates(file)
      if File.extname(file) == ".json"
        JSON.parse(File.read(file))
      elsif File.extname(file) == ".csv"
        CSV.read(file, headers:true)
      else raise FileError
      end
    end

    def self.date_convert(file, date)
        fx_dates(file).fetch(date.strftime) { raise DateError }
    end

    def self.to_currency(file, date, to)
      if to == BASE_RATE
        return 1
      elsif File.extname(file) == ".json"
        date_convert(file, date).fetch(to) { raise CurrencyError }
      elsif File.extname(file) == ".csv"
        csv_file = CSV.read(file, headers:true)
        csv_to_rate = csv_file.to_a.collect { |col_1, col_2, col_3| col_3 if col_1 == date && col_2 == to}.compact
        csv_to_rate.first.to_f
      end
    end

    def self.from_currency(file, date, from)
      if File.extname(file) == ".json"
        date_convert(file, date).fetch(from) { raise CurrencyError }
      elsif File.extname(file) == ".csv"
        csv_file = CSV.read(file, headers:true)
        csv_from_rate = csv_file.to_a.collect { |col_1, col_2, col_3| col_3 if col_1 == date && col_2 == from}.compact
        csv_from_rate.first.to_f
      end
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
