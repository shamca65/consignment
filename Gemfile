source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'mysql2'
gem 'rails', '~> 5.2.1'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  # Programmatically start and stop ES for tests
  gem 'elasticsearch-extensions'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
gem 'devise', '~> 4.5'
gem 'bootsnap', '~> 1.3', '>= 1.3.2'
gem 'gritter', '1.2.0'
gem 'administrate', '~> 0.11.0'
gem 'bourbon', '~> 5.1'

# Elasticsearch integration
gem 'elasticsearch-model'
gem 'elasticsearch-rails'