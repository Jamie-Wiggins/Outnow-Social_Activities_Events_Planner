source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3', '~> 1.4', '>= 1.4.2'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
 gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
 gem 'bcrypt', '~> 3.1.7'
# Use Active Storage variant
 gem 'image_processing', '~> 1.2'
 gem 'binding_of_caller'
gem 'gon'
gem 'pg'
gem 'logstop'

#secuirty
gem 'lockbox'
gem 'blind_index'

# bulma for rails
gem 'bulma-rails', '~> 0.8.0'

#font-awesome for bulma
gem 'font-awesome-sass', '~> 5.11.2'

# simple form for eaier form management
gem 'simple_form', '~> 5.0', '>= 5.0.1'

#devise for users
gem 'devise', '~> 4.7', '>= 4.7.1'

#active admin for users
gem 'activeadmin'

#jquery
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'

#popper
gem 'popper_js', '~> 1.14', '>= 1.14.5'

#faker - for rails testing
gem 'faker'
gem 'faker-bot'

gem 'carrierwave'

gem 'cloudinary'
#gem "mini_magic"

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false


gem 'simple_calendar', '~> 2.3.0'
gem 'stripe', '~> 4.0', '>= 4.0.2'
gem 'coffee-script', '~> 2.4', '>= 2.4.1'

gem 'rack-cors', '~> 1.1', '>= 1.1.1'

#twitter API gem
gem 'twitter'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  # guard
  gem 'guard', '~> 2.16', '>= 2.16.1'

  # guard livereload reload on save
  gem 'guard-livereload', '~> 2.5', '>= 2.5.2', require: false

  # better errors - easier error reading
  gem 'better_errors', '~> 2.5', '>= 2.5.1'

end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  #controller testing
  gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]