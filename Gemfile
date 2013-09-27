source 'https://rubygems.org'

ruby '2.0.0'

# Core
gem 'rails', '>= 4.0.0'
gem 'pg'
gem 'unicorn'
gem 'email_validator'
gem 'high_voltage'
gem 'rack-timeout'
gem 'recipient_interceptor'
gem 'uglifier'
gem 'simple_enum'
gem 'devise'

# Assets
gem 'sass-rails'
gem 'jquery-rails'
gem 'coffee-rails'
gem 'haml-rails'
gem 'simple_form'
gem 'bourbon'
gem 'neat'

group :development do
  gem 'binding_of_caller'
  gem 'foreman'
  gem 'guard', '>= 2.0.0.pre.3'
  gem 'guard-rspec'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails', '>= 2.14'
end

group :test do
  gem 'capybara-webkit', '>= 1.0.0'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'newrelic_rpm', '>= 3.6.7'
  gem 'rails_12factor'
end
