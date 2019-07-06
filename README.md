# FX Calculator

This script obtains and calculates foreign exchange rates using a given source. We have used a JSON file as our source of dates and foreign exchange rates.

## Setup 

Ensure you have installed [Ruby](https://www.ruby-lang.org/en/downloads/), [Rubygems](https://rubygems.org/pages/download) (a package manager framework for Ruby) and [Bundler](https://bundler.io/) (a Ruby gem management gem).

## Installation 
1. Fork this repo (for instructions, [see here](https://help.github.com/en/articles/fork-a-repo))

1. Navigate to the repo directory in your terminal (check out these links for [mac](https://www.imore.com/how-use-terminal-mac-when-you-have-no-idea-where-start), [windows](https://www.lifewire.com/command-prompt-2625840) or [linux](https://www.howtogeek.com/140679/beginner-geek-how-to-start-using-the-linux-terminal/) for instructions)

1. Install gems: ```bundle install```

1. Run tests: ```bundle exec ruby test/run_tests.rb```

1. Start a console session (if it's your first time, see this [helpful tutorial](https://www.digitalocean.com/community/tutorials/how-to-use-irb-to-explore-ruby)): ```bundle exec irb -Ilib```

1. Load the template library: ```require 'currency_exchange'```

1. Calculate an exchange rate: ```CurrencyExchange.rate(date: Date.new(2018,11,22), from: "GBP", to: "USD", file: 'data/eurofxref-hist-90d.json')```

## Help
If you run into any problems in the setup or installation of this programme, please raise an issue or if you're not familiar with GitHub, please feel free to reach out on [Twitter](https://twitter.com/a_adewusi). 

Remember, as the late great [Jim Weirich](https://github.com/benlangfeld/ruby-koans/blob/master/README.rdoc) noted, mountains are merely mountains, so don't worry if you get stuck - we are here to help :heart:

## Design Decisions

We've used [**Keyword arguments**](https://thoughtbot.com/blog/ruby-2-keyword-arguments) to make it easier for users to enter their own method arguments as well as read method calls. This seems particularly pertinent given we use two currency rates and the position of them in a **Positional Argument** structure could easily be confusing. 

We have implemented two exception cases that currently have tests checking the generated error messages if a currency or date requested is not found in the given file.

## Progressive Enhancements 

We are working on a feature which will make it easy for users to amend the **File type**. Currently this script uses a JSON file, but we would like to accept CSV and raise an error if a non-JSON or CSV file is used. 

This script requires a File containing FX rates and dates. We have made this File a [**constant**](https://www.rubyguides.com/2017/07/ruby-constants/) in our script, but we intend that this can easily be changed by the user in the future.
