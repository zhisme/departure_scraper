# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'departure_scraper/version'

Gem::Specification.new do |spec|
  spec.name          = 'departure_scraper'
  spec.version       = DepartureScraper::VERSION
  spec.authors       = ['Zhdanov']
  spec.email         = ['evdev34@gmail.com']

  spec.summary       = 'Scraper with caching on flights departure'
  spec.description   = 'Scrape, enrich, leverage, get rich'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '>= 5.2.3', '< 6.2.0'
  spec.add_dependency 'capybara', '~> 3.11'
  spec.add_dependency 'dalli', '~> 2.7.10'
  spec.add_dependency 'database_cleaner', '~> 1.7'
  spec.add_dependency 'mysql2', '~> 0.5.2'
  spec.add_dependency 'rest-client', '~> 2.0'
  spec.add_dependency 'selenium-webdriver', '~> 3.5'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'factory_bot', '~> 5.1'
  spec.add_development_dependency 'pry', '~> 0.12.2'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
