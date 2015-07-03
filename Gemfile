source 'https://rubygems.org'
ruby '2.2.2'

# Stack
gem 'rails', '4.2.0'
gem 'pg'
gem 'puma'
gem 'foreman'

# View
gem 'slim-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'simple_form'

# Admin
gem 'activeadmin', github: 'activeadmin'

# Uploads
gem 'fog'
gem 'carrierwave'
gem 'mini_magick'

# Auth
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'cancancan'

# Misc
gem 'exception_notification'
gem 'httparty'
gem 'active_model_serializers'

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'

  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', require: false, github: 'thoughtbot/shoulda-matchers'
  gem 'capybara'
end

group :development, :test do
  gem 'rspec-rails'

  gem 'guard'
  gem 'guard-rspec'
  gem 'terminal-notifier-guard', require: false # Shows test alerts in OS X 10.8 Notification Center

  gem 'letter_opener'
end

group :development, :test, :staging do
  gem 'ffaker'
end

# Logging
group :production, :staging do
  gem 'rails_12factor'
end
