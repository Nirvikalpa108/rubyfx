# http://test-unit.github.io/
require 'test/unit'
require 'currency_exchange'
require 'date'

class CurrencyExchangeTest < Test::Unit::TestCase
  def setup
  end

  def test_non_base_currency_exchange_is_correct
    correct_rate = 1.2870493690602498
    assert_equal correct_rate, CurrencyExchange.rate(date: Date.new(2018,11,22), from: "GBP", to: "USD", file: 'data/eurofxref-hist-90d.json')
  end

  def test_base_currency_exchange_is_correct
    correct_rate = 0.007763975155279502
    assert_equal correct_rate, CurrencyExchange.rate(date: Date.new(2018,11,22), from: "JPY", to: "EUR", file: 'data/eurofxref-hist-90d.json')
  end

  def test_exception_raised_if_no_from_rate
   assert_raise(CurrencyError.new("Error - unable to calculate rate requested")) do
     CurrencyExchange.rate(date: Date.new(2018,11,22), from: "NGN", to: "USD", file: 'data/eurofxref-hist-90d.json')
   end
  end

  def test_exception_raised_if_no_to_rate
    assert_raise(CurrencyError.new("Error - unable to calculate rate requested")) do
      CurrencyExchange.rate(date: Date.new(2018,11,22), from: "GBP", to: "NGN", file: 'data/eurofxref-hist-90d.json')
    end
  end

  def test_exception_raised_if_no_rate_for_date
   assert_raise(DateError.new("Error - no rate at date found")) do
      CurrencyExchange.rate(date: Date.new(2008,11,22), from: "GBP", to: "USD", file: 'data/eurofxref-hist-90d.json')
   end
  end

  def test_currency_exchange_correct_for_CSV_file
    correct_rate = 1.2870493690602498
    assert_equal correct_rate, CurrencyExchange.rate(date: Date.new(2018,11,22), from: "GBP", to: "USD", file: 'data/eurofxref-hist-90d.csv')
  end

  def test_exception_raised_for_non_JSON_and_CSV_file_types
    assert_raise(FileError.new("Error - this file type is not accepted. Try JSON or CSV.")) do
      CurrencyExchange.rate(date: Date.new(2018,11,22), from: "GBP", to: "USD", file: 'data/eurofxref-hist-90d.xml')
    end
  end
end
