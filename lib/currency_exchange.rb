require 'json'
require 'date'

class CurrencyExchange

  BASE_RATE = 'EUR'

  def self.rate(date:, from:, to:, file:)
    to_currency(file, date, to) / from_currency(file, date, from)
  end

  private
  def self.fx_dates(file)
      JSON.parse(File.read(file))
  end

  def self.date_convert(file, date)
    fx_dates(file).fetch(date.strftime) { raise DateError }
  end

  def self.to_currency(file, date, to)
    if to == BASE_RATE
      return 1
    else
      date_convert(file, date).fetch(to) { raise CurrencyError }
    end
  end

  def self.from_currency(file, date, from)
    date_convert(file, date).fetch(from) { raise CurrencyError }
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


