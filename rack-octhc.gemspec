Gem::Specification.new do |gem|
  gem.name = 'rack-octhc'
  gem.version = '1.0.0'

  gem.authors = ['Jay Wagnon']
  gem.email = ['jay.wagnon@octanner.com']

  gem.description = %q{Rack module for handling OC Tanner Operation's Health Checks.}
  gem.summary = gem.description
  gem.homepage = 'https://github.com/octanner/rack-octhc'

  gem.files = %w(README.md rack-octhc.gemspec)
  gem.files += Dir.glob("lib/**/*.rb")
  gem.files += Dir.glob("spec/**/*.rb")
  gem.require_paths = %w[lib]

  gem.test_files = Dir.glob("spec/**/*")

  gem.add_dependency 'rack'
end
