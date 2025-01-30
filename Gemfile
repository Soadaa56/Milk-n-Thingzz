source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem 'rails', '~> 7.1'

gem 'bootstrap', '~> 5.3.1'
gem 'turbo-rails'
gem 'stimulus-rails'

gem "importmap-rails", "~> 1.2"
gem 'devise', '~> 4.9', '>= 4.9.2'
gem 'shrine', '~> 3.5'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem 'bullet'
  gem "sqlite3", "~> 1.4"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "solargraph", "~> 0.49.0"
gem 'pg', '~> 1.2'
gem 'aws'
gem 'acts_as_list'
