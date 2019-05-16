# FX Calculator

This script obtains and calculates foreign exchange rates using a given source. We have used a JSON file as our source of dates and foreign exchange rates.

## Setup 

Ensure you have installed [Ruby](https://www.ruby-lang.org/en/downloads/), [Rubygems](https://rubygems.org/pages/download) (a package manager framework for Ruby) and [Bundler](https://bundler.io/) (a Ruby gem management gem).

## Installation 
1. Install gems: ```bundle install```

2. Run tests: ```bundle exec ruby test/run_tests.rb```

3. Start a console session: ```bundle exec irb -Ilib```

4. Load the template library: ```require 'currency_exchange'```

5. Calculate an exchange rate: ```CurrencyExchange.rate(Date.new(2018, 11, 22), "USD", "GBP")```

## Help

If it's your first time running the interactive Ruby shell (IRB) in your terminal, see this [helpful tutorial](https://www.digitalocean.com/community/tutorials/how-to-use-irb-to-explore-ruby). 

If you run into any problems in the setup or installation of this programme, please raise an issue or if you're not familiar with GitHub, please feel free to reach out on [Twitter](https://twitter.com/a_adewusi). 

Remember, as the late great [Jim Weirich](https://github.com/benlangfeld/ruby-koans/blob/master/README.rdoc) noted, mountains are merely mountains, so don't worry if you get stuck - we are all here to help :heart:

## Design Decisions
