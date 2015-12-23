source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

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
  # It is also recommended to use Autoprefixer with Bootstrap to add browser vendor prefixes automatically.
  # Simply add the gem:
  gem 'autoprefixer-rails'
end

group :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end

gem 'devise'
gem 'devise-bootstrap-views'
# Upmin Admin is a framework for creating powerful admin backends with minimal effort.
gem 'upmin-admin', git: 'https://github.com/upmin/upmin-admin-ruby', branch: 'master'

gem 'pg_search'

gem 'delayed_job'
gem 'delayed_job_active_record'
gem 'delayed_job_web'
gem 'daemons'

gem 'workless'
gem 'colorize'

# Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/]
gem 'pg'

gem 'envb-rails'
gem 'jbuilder'
gem 'bower-rails'
gem 'angular-rails-templates'

#Whenever is a Ruby gem that provides a clear syntax for writing and deploying cron jobs.
gem 'whenever', require: false
gem 'rufus-scheduler'

gem 'language_list' # List languages we could use into our system and even more...

# Exception notification for Rails apps
gem 'exception_notification'

gem 'feedjira'

gem 'paperclip'
gem 'aws-sdk-v1', '1.65.0'
gem 'aws-sdk', '~> 2'

group :development, :test do
  gem 'pry-rails'
  gem 'binding_of_caller'
  gem 'zeus'
  gem 'better_errors'
  gem 'poltergeist'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'codeclimate-test-reporter'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'teaspoon-jasmine'
  gem 'phantomjs'
  gem 'mailcatcher'
end
