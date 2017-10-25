source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'

# Application Core
gem 'turbolinks', '~> 5'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'puma', '~> 3.7'
gem 'devise', '4.3.0'
gem 'rails_admin', '~> 1.0'
gem 'figaro'

# Preprocessors / Helpers
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '4.2.2'
gem 'jbuilder', '~> 2.5'
gem 'haml-rails', '~> 1.0.0'
gem 'colorize'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'simple_form'
gem 'bootstrap-combobox', '~> 1.2', '>= 1.2.6'

# gem 'bcrypt', '~> 3.1.7' # Use ActiveModel has_secure_password

# Development and Testing
group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring' # Speed up dev by keeping app running in background
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'listen'
  gem 'better_errors'
  gem 'brakeman', require: false
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  gem 'capistrano-figaro-yml'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'rspec-collection_matchers'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'rb-fsevent', :require => false
end

group :test do
  gem 'factory_girl_rails'
  gem 'faker','>= 1.8.4'
end
