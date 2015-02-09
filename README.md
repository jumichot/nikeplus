# NikePlus


Nike+ Ruby API wrapper

[![Build Status](https://travis-ci.org/jumichot/nikeplus.svg?branch=master)](https://travis-ci.org/jumichot/nikeplus)
[![Dependency Status](https://gemnasium.com/jumichot/nikeplus.svg)](https://gemnasium.com/jumichot/nikeplus)
[![Code Climate](https://codeclimate.com/github/jumichot/nikeplus/badges/gpa.svg)](https://codeclimate.com/github/jumichot/nikeplus)
[![Test Coverage](https://codeclimate.com/github/jumichot/nikeplus/badges/coverage.svg)](https://codeclimate.com/github/jumichot/nikeplus)
[![License](http://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](http://opensource.org/licenses/MIT)

## TODO
- add fetch token during initialization
- add json serialization
- add delegators on Account to aggregate data
- add usage in this readme
- lifetime distance : refactore this methode
- add doc
- add metaprogramming for getter in aggregate data
- handle refresh token
- add cache strategy
- add configuration

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nikeplus'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nikeplus

## Usage

```ruby
nike = NikePlus::Account.new("your-email@gmail.com","your-nike-password")
nike
```


## Tests
Run tests with:
```ruby
bundle exec rspec
```
or
```ruby
guard
```
If you want guard notification on OS X you need to install terminal-notifier-guard:
```ruby
brew install terminal-notifier
```
Then
```ruby
gem install terminal-notifier-guard
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/nikeplus/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
