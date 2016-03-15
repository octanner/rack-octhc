require 'simplecov'
SimpleCov.start

require 'rack/test'
require 'ostruct'

require 'rack-octhc'

RSpec.configure do |config|
  config.order = "random"
end
