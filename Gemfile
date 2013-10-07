source 'https://rubygems.org'

ruby '2.0.0'

# Core
gem 'rails', '>= 4.0.0'
gem 'pg'
gem 'unicorn'
gem 'email_validator'
gem 'rack-timeout'
gem 'recipient_interceptor'
gem 'uglifier'
gem 'simple_enum'
gem 'devise'
gem 'cancan'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'activerecord-session_store'
gem 'rails_config'
gem 'draper'
gem 'carrierwave'
gem 'mini_magick'

# Assets
gem 'sass-rails'
gem 'jquery-rails'
gem 'coffee-rails'
gem 'haml-rails'
gem 'simple_form'
gem 'twitter-bootstrap-rails', github: 'seyhunak/twitter-bootstrap-rails', branch: :bootstrap3

group :development do
  gem 'binding_of_caller'
  gem 'foreman'
  gem 'guard', '>= 2.0.0.pre.3'
  gem 'guard-rspec'
end

group :development, :test do
  gem 'pry'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '>= 2.14'
  gem 'thin'
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
