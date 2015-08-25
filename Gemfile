source 'https://rubygems.org'

# Declare ruby version for Heroku
ruby '2.2.2'
# Include for Heroku injection
gem 'rails_12factor', group: :production
# Puma for Heroku
gem 'puma'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
# Use postgres instead
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 2.7.1'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.3.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.1', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# My Stuff
## Devise for user authentication
gem "devise"
## Paperclip for file uploads
gem "paperclip", "~> 4.2"
## Will Paginate for pagination
gem 'will_paginate', '~> 3.0.6'
## Ransack for searching
gem 'ransack'
## Acts as Taggable On for tagging
gem 'acts-as-taggable-on', '~> 3.4'
## Local Time for localised time
gem 'local_time'
## High Voltage for easy static pages
gem 'high_voltage', '~> 2.3.0'
## Select2 for tagging interface
#gem 'select2-rails'
## Jquery Ui for drag and drop sorting
gem 'jquery-ui-rails'
## Compass for mixins, user master branch
gem 'compass-rails', github: "Compass/compass-rails", branch: "master"
## Susy for grid
gem 'susy'
## font awesome for icons
gem 'font-awesome-sass'
## Yaml db for db migrations
#gem 'yaml_db'
## AWS SDK for S3 storage
#gem 'aws-sdk'
# paperclip doesn't support aws-sdk v2+ yet
gem 'aws-sdk', '< 2.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
