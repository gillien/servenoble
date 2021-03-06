source 'https://rubygems.org'
ruby '2.3.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7.1'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

group :assets do
  # Use CoffeeScript for .js.coffee assets and views
  gem 'coffee-rails'
  gem 'haml'
  gem 'haml-rails'
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier'
  # Use SCSS for stylesheets
  gem 'sass-rails'
  # Use jquery as the JavaScript library
  gem 'jquery-rails'
  # It is also recommended to use Autoprefixer with Bootstrap to add browser vendor prefixes
  # automatically. Simply add the gem:
  gem 'autoprefixer-rails'
end

group :production do
  gem 'aws-sdk'
  gem 'newrelic_rpm'
  gem 'rails_12factor'
end

gem 'devise'
gem 'devise-bootstrap-views'
# Upmin Admin is a framework for creating powerful admin backends with minimal effort.
gem 'upmin-admin'

gem 'pg_search'

gem 'daemons'
gem 'delayed_job'
gem 'delayed_job_active_record'
gem 'delayed_job_web'

gem 'colorize'
gem 'workless'

# Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/]
gem 'pg'

gem 'bower-rails'
gem 'envb-rails'
gem 'jbuilder'
gem 'non-stupid-digest-assets'

# Whenever is a Ruby gem that provides a clear syntax for writing and deploying cron jobs.
gem 'rufus-scheduler'
gem 'whenever', require: false

gem 'language_list' # List languages we could use into our system and even more...

# Exception notification for Rails apps
gem 'exception_notification'

gem 'feedjira'

gem 'paperclip'

gem 'capistrano'
gem 'capistrano-bundler'
gem 'capistrano-rails'

gem 'rubocop', require: false

# Add this if you're using rbenv
gem 'capistrano-rbenv', github: 'capistrano/rbenv'

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capybara'
  gem 'codeclimate-test-reporter'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'phantomjs'
  gem 'poltergeist'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'teaspoon-jasmine'
end
