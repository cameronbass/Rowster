source 'https://rubygems.org'

ruby '2.2.1'

gem 'rails', '4.2.6'

gem 'devise'
gem 'twitter-bootstrap-rails'
gem 'devise-bootstrap-views'
gem 'devise_invitable'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'pry-rails'
gem 'ransack'
gem "puma"
gem "figaro"
gem 'gibbon',  '~>1.2.0'
gem 'sidekiq'
gem 'whenever', :require => false

group :production do
  gem "pg"
  gem "rails_12factor"
end

group :development, :test do
  gem 'byebug'
  gem "sqlite3"
  gem "rspec-rails"
  gem "capybara"
  gem "factory_girl_rails"
  gem "simplecov", require: false
  gem "shoulda-matchers"
  gem "rake"
  gem "vcr"
  gem "webmock"
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end
