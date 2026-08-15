source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.7"
gem 'rails', '~> 8.1'
gem 'puma', '~> 6.4'
gem "propshaft"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "dartsass-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console"
  gem 'bullet'
  gem "sqlite3", ">= 2.1"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

# Images
gem "image_processing", "~> 1.2"
gem 'devise', '~> 4.9', '>= 4.9.2'
gem 'shrine', '~> 3.5'

# Custom 
gem "jsbundling-rails"
gem 'pg', '~> 1.2'
gem 'aws-sdk-rails', '~> 5'
gem 'acts_as_list'
gem 'requestjs-rails'
gem "rack-attack", "~> 6.8"
