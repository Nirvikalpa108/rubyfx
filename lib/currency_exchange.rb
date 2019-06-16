require 'json'
require 'date'

module CurrencyExchange

  def self.rate(date, from_currency, to_currency)
    file_name = 'data/eurofxref-hist-90d.json'
    nested_hash = JSON.parse(File.read(file_name))
    hash = nested_hash[date.strftime]
    hash.default = 1
    hash[to_currency] / hash[from_currency]
  end
end


# Raises an exception if unable to calculate requested rate.
# Raises an exception if there is no rate for the date provided.
