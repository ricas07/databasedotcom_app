source 'https://rubygems.org'

gem 'rails', '3.2.6'

group :development do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.10.0'
  gem 'bootstrap-sass', '2.0.0'
  gem 'guard-rspec', '0.5.5'
  gem 'bcrypt-ruby', '3.0.1'

# Salesforce Gems required to access Salesforce Objects
# Look in lib/sfdc_models.rb to materialize sf objects
  gem 'databasedotcom'
  gem 'databasedotcom-rails'

gem 'annotate', '~> 2.4.1.beta', group: :development

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'bootstrap-sass', '2.0.0'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
  gem 'bcrypt-ruby', '3.0.1'
  gem 'sass-rails',   '3.2.4'
end

gem 'jquery-rails', '2.0.0'

# Test gems on Linux
group :test do
  gem 'rspec-rails', '2.10.0'
  gem 'capybara', '1.1.2'
  gem 'rb-inotify', '0.8.8'
  gem 'libnotify', '0.5.9'
  gem 'guard-spork', '0.3.2'
  gem 'spork', '0.9.0'
  gem 'factory_girl_rails', '1.4.0'
end  

group :production do
  gem 'pg', '0.12.2'
end
