require 'rubygems'
require 'spork'
require 'database_cleaner'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rake'
  require 'rspec/rails'
  require 'rspec/autorun'
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  RSpec.configure do |config|
    config.use_transactional_fixtures = false
    config.infer_base_class_for_anonymous_controllers = false
    config.include Requests::JsonHelpers, type: :request
  end

  Rails.application.routes.default_url_options[:host] = 'test.host'
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
end

Spork.each_run do
  # This code will be run each time you run your specs.

end
