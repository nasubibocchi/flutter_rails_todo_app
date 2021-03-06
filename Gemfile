source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"
gem "rails", "~> 7.0.2", ">= 7.0.2.3"
gem "sprockets-rails"
gem 'mysql2'

# Use sqlite3 as the database for Active Record
# gem "sqlite3", "~> 1.4"

gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem 'activerecord-import'
gem 'bcrypt', '>= 3.1.12'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'active_model_serializers'
gem 'annotate'
gem 'json', '>= 2.3.0'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'parallel_tests'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem "sqlite3", "1.4.2"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'simplecov', require: false
  gem 'webmock'
end

group :production do
  gem "pg", "1.1"
end
