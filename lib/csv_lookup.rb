require_relative 'error'
require 'csv'

class CsvLookup
  def initialize(file, date, from, to)
    @file = file
    @date = date
    @from = from
    @to = to
  end

  def to_currency
    if @to == BASE_RATE
      return 1
    else
    found = data.find do |row|
      Date.parse(row["Date"]) == @date && row["Currency"] == @to
    end
    found["FX Rate"].to_f
    end
  end

  def from_currency
    found = data.find do |row|
      Date.parse(row["Date"]) == @date && row["Currency"] == @from
    end
    found["FX Rate"].to_f
  end

  private
  def read(file)
    CSV.read(file, headers:true)
  end

  def data
    @data = []
    read(@file).each do |row|
      @data << row
    end
    @data
  end
end
