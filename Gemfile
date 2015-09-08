source 'https://rubygems.org'
ruby '2.2.2'

# Stack
gem 'rails', '4.2.3'
gem 'pg'
gem 'puma'
gem 'foreman'
gem 'turbolinks'
gem 'jquery-turbolinks'

# View
gem 'slim-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'simple_form'
gem 'font-awesome-rails'
gem 'bootstrap-sass'
gem 'ckeditor'

# Uploads
gem 'fog'
gem 'carrierwave'
gem 'mini_magick'
gem 'paperclip'

# Auth
gem 'devise'
gem 'omniauth-twitter'
gem 'cancancan'

# Payment
gem 'stripe', git: 'https://github.com/stripe/stripe-ruby'

# Misc
gem 'exception_notification'
gem 'httparty'
gem 'active_model_serializers'

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'

  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry'
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
