if ENV["CODECLIMATE_REPO_TOKEN"]
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'devise'

# This file was generated by the `rails generate rspec:install` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause
# this file to always be loaded, without a need to explicitly require it in any
# files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need
# it.
#
# The `.rspec` file also contains a few flags that are not defaults but that
# users commonly want.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
  end

  config.after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  config.around(:each, type: :feature, js: true) do |ex|
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
    self.use_transactional_fixtures = false
    ex.run
    self.use_transactional_fixtures = true
    DatabaseCleaner.clean
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
