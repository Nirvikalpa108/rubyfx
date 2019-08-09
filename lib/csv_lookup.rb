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
    csv_file = read(@file)
    csv_to_rate = csv_file.to_a.collect { |col_1, col_2, col_3| col_3 if col_1 == @date && col_2 == @to}.compact
    csv_to_rate.first.to_f
  end

  def from_currency
    csv_file = read(@file)
    csv_from_rate = csv_file.to_a.collect { |col_1, col_2, col_3| col_3 if col_1 == @date && col_2 == @from}.compact
    csv_from_rate.first.to_f
  end

  private
  def read(file)
    CSV.read(file, headers:true)
  end
end