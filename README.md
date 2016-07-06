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

Create an initializer:

```ruby
require 'rack-octhc'
Rails.application.config.middleware.use Rack::OCTanner::HealthCheck
```

#### Flash Messages, Redirects and OCTHC

If your Rails application is using flash messages and redirects, you may want to inject the OCTHC middleware early in your stack:
```ruby
require 'rack-octhc'
class Application < Rails::Application
  Rails.application.config.middleware.insert_before ActionDispatch::Static, Rack::OCTanner::HealthCheck
end
```
This will prevent redirects from losing their message content upon redirect.


## Health Checks

Operations will occasionally send HTTP requests to the '/octhc' endpoint
of managed applications.  This middleware will listen on that endpoint and
return an expected response, informing Operations that the
application is running.
