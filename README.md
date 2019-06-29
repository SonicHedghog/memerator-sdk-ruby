# Memerator-sdk-ruby

A ruby library for Memerator.

## What is this for?

I mean, why not.

## Usage

Put this near the top of your ruby whatever:

```ruby
require 'memerator'

Memerator = Memerator.new(token: api_token)
```

Now, when you need to run a method, run Memerator.method.

Example for getting profile.

```ruby
"I am on #{Memerator.profile.username} servers!"
# => "Chewsterchew"
```

## Documentation

Stuck? Know Ruby? Check out the [documentation](https://rubydocs.chew.pro/docs/memerator).

## But ruby sucks

no it's great
