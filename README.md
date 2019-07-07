# Memerator API for Ruby

A ruby library for Memerator.

## What is this for?

I mean, why not.

## Disclaimer

The gem is currently in Beta! Until you see that nice 1.0.0, expect bugs!

What the API has that this gem can't do yet:

~~* Set your username~~ Implemented in next release :)
* Get recent memes
* Get top memes
~~* Get top memers~~ Implemented in next release :)
* Submit a meme

## Usage

Put this near the top of your ruby whatever:

```ruby
require 'memerator'

Meme = Memerator.new(token: api_token)
```

Now, when you need to run a method, run Meme.method.

Example for getting profile.

```ruby
"My username is #{Meme.profile.username}!"
# => "My username is Chew!"
```

## Lost? allowsMultipleStreams?

We have a nice helpful support channel on our official Discord Server! Join with [this link](https://discord.gg/FxjjnSF). IRC lover? Join #memerator on irc.chew.pro or irc.freenode.net

## Documentation

Stuck? Know Ruby? Check out the [documentation](https://rubydocs.chew.pro/docs/memerator).

## Contributing

We love contributors! Feel free to open a PR and we will review it.

## But ruby sucks

no it's great
