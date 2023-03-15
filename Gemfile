source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '6.1.7.3'
gem 'puma', '~> 3.12.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'sass-rails', '~> 5.1', '>= 5.1.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2', '>= 4.2.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.9', '>= 2.9.1'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'rake', '< 11'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'rubocop', '~> 0.76.0', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'shoulda-matchers', '~> 2.8.0', require: false
  gem 'webmock'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'meta_request'
  gem 'rb-readline'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.7.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.29.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  gem 'rails-controller-testing', require: false
  gem 'rspec'
  gem 'rspec-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Codecov, code coverage
gem 'codecov', :require => false, :group => :test
gem 'simplecov', :require => false, :group => :test

# Project Related Gems
gem 'awesome_print', require: 'ap'
gem 'awesome_rails_console'
gem 'bulma-rails', '~> 0.8.0'
gem 'bulma-extensions-rails'
gem 'coderay'
gem 'devise'
gem 'faker'
gem 'font-awesome-rails', '>= 4.7.0.6'
gem 'jquery-rails'
gem 'paper_trail'
gem 'pluck_to_hash'
gem 'nestive', '~> 0.6', '>= 0.6.0'
gem 'redcarpet'
gem "recaptcha", :require => "recaptcha/rails"
gem 'slim-rails'
gem 'will_paginate', '~> 3.1.0'
