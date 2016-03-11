require 'simplecov'
SimpleCov.start

require 'rack/test'
require 'rack-oct-health-check'
require 'ostruct'
RSpec.configure do |config|
  config.order = "random"
end
