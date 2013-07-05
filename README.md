# AtomicParsleyRuby

v = AtomicParsleyRuby::Media.new("test.mp4")

v.encode do |config|
    config.artist "Some Guy"
    config.year "2012"
    config.genre "Punk Rock"
    config.artwork "cover.png"
end

## Installation

Add this line to your application's Gemfile:

    gem 'atomic-parsley-ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install atomic-parsley-ruby

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
