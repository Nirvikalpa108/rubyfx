require_relative 'json_lookup'
require_relative 'csv_lookup'
require_relative 'error'

class CurrencyExchange

  def initialize(file:, date:, from:, to:)
    @file = file
    @date = date
    @from = from
    @to = to
  end

  def rate
    lookup = find_lookup
    lookup.to_currency / lookup.from_currency
  end

  private
  def find_lookup
    case File.extname(@file)
    when ".json"
      JsonLookup.new(@file, @date, @from, @to)
    when ".csv"
      CsvLookup.new(@file, @date, @from, @to)
    else raise FileError
    end
  end
end



