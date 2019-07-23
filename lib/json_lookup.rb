# require_relative 'error'
# put error classes in separate files
#
class JsonLookup
  def initialize(file, date, from, to)
    @file = file
    @date = date
    @from = from
    @to = to
  end

  def to_currency
    date_format(@file, @date).fetch(@to) { raise CurrencyError }
  end

  def from_currency
    date_format(@file, @date).fetch(@from) { raise CurrencyError }
  end

  private
  def read(file)
    JSON.parse(File.read(file))
  end

  def date_format(file, date)
    read(file).fetch(date.strftime) { raise DateError }
  end
end