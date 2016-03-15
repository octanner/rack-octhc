# rack-octhc

Rack module for handling OC Tanner Operation's Health Checks.

## Getting Started

Add the gem to your Gemfile, and bundle.

```ruby
gem 'rack-octhc', git: 'https://github.com/octanner/rack-octhc.git'
```

```
bundle install
```

## Rails Intergration

### Configuration

Add the following to your config/applications.rb:

```ruby
require 'rack-octhc'
class Application < Rails::Application
  config.middleware.use Rack::OCTanner::HealthCheck
end
```

Or in an initializer:

```ruby
require 'rack-octhc'
Rails.application.config.middleware.use Rack::OCTanner::HealthCheck
```

## Health Checks

Operations will occasionally send HTTP requests to the '/octhc' endpoint
of managed applications.  This middleware will listen on that endpoint and
return an expected response, informing Operations that the
application is running.
