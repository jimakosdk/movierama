source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '3.2.13'
gem 'jquery-rails'
gem 'pg'
gem 'bcrypt-ruby', '3.0.1'
gem 'will_paginate'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'uglifier', '>= 1.0.3'
end


group :test, :development do
  gem "rspec-rails"
  gem "factory_girl_rails"
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'orderly'
  gem 'launchy'
  gem 'selenium-webdriver', '2.43.0' # update this gem to latest version
  gem 'database_cleaner'
end

group :development do
  gem 'annotate', '2.5.0'
  gem 'better_errors'
end
