# http://test-unit.github.io/
require 'test/unit'
require 'currency_exchange'
require 'date'

class CurrencyExchangeTest < Test::Unit::TestCase
  def setup
  end

  def test_non_base_currency_exchange_is_correct
    correct_rate = 1.2870493690602498
    assert_equal correct_rate, CurrencyExchange.rate(Date.new(2018,11,22), "GBP", "USD")
  end

  def test_base_currency_exchange_is_correct
    correct_rate = 0.007763975155279502
    assert_equal correct_rate, CurrencyExchange.rate(Date.new(2018,11,22), "JPY", "EUR")
  end

  def test_exception_raised_if_unable_to_calculate_rate
  #  assert_raise(CurrencyExchange::CurrencyError.new("Error - unable to calculate rate requested")) do
  #    CurrencyExchange.rate(Date.new(2018,11,22), "NGN", "USD")
   # end
  end

  def test_exception_raised_if_no_rate_for_date
   # assert_raise(CurrencyExchange::DateError.new("Error - unable to calculate rate requested")) do
   #   CurrencyExchange.rate(Date.new(2008,11,22), "GBP", "USD")
   # end
  end
end

