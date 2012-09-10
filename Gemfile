source 'https://rubygems.org'

gem 'rails', '3.2.6'

group :development do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.10.0'
  gem 'bootstrap-sass', '2.0.0'
  gem 'guard-rspec', '0.5.5'
  gem 'bcrypt-ruby', '3.0.1'

  gem 'databasedotcom'
  gem 'databasedotcom-rails'
  gem 'faker', '1.0.1'
  gem 'will_paginate', '~> 3.0'
  gem 'bootstrap-will_paginate', '0.0.6'
  
  # For Salesforce but this may not work... checking it out.
  # gem 'asf-soap-adapter', :require => 'activerecord-activesalesforce-adapter'
  # I don't know why the above ^^ works, while the following line throws an error
  # gem 'activerecord-activesalesforce-adapter', :require => 'activerecord-activesalesforce-adapter'
  # gem 'databasedotcom'
  # gem 'rforcedotcom'
  # gem 'facets', :require => false
  # gem 'activesalesforce'
  # end salesforce
end

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
gem 'will_paginate', '~> 3.0'
gem 'bootstrap-will_paginate', '0.0.6'

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
  gem 'databasedotcom'
  gem 'databasedotcom-rails'
end
