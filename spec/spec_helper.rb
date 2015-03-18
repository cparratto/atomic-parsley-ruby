require 'rspec'
require 'rspec/its'

require 'atomic-parsley-ruby' # and any other gems you need

RSpec.configure do |config|
  config.mock_with :mocha
  config.order = "random"
end