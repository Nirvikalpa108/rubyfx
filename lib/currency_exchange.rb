require 'json'
require 'date'

class CurrencyExchange

  class CurrencyError < StandardError
  end

  class DateError < StandardError
  end

  class RateCalculate
    attr_accessor :date

    def initialise(date)
      @date = date
    end

    def convert(date, from_currency, to_currency)
      hash = nested_hash[date.strftime]
      if to_currency == "EUR"
        hash.default = 1
      end
      hash[to_currency] / hash[from_currency]
    end

    private
    def nested_hash
      JSON.parse(File.read(file_name))
    end

    def file_name
      'data/eurofxref-hist-90d.json'
    end
  end

  def self.rate(date, from_currency, to_currency)
    RateCalculate.new.convert(date, from_currency, to_currency)
  end
end