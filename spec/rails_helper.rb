ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "spec_helper"
require "rspec/rails"
require "shoulda-matchers"
require File.join(File.dirname(__FILE__), "support/valid_attribute")
require File.join(File.dirname(__FILE__), "support/factory_girl")
require "capybara/rspec"
require "coveralls"
require "webmock/rspec"
Coveralls.wear!("rails")

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
Dir[Rails.root.join("lib/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.allow_url("https://fonts.googleapis.com/icon?family=Material+Icons")
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true

  # config.around(:each) do |example|
    # if example.metadata[:type] == :feature
      # WebMock.allow_net_connect!
      # VCR.turned_off { example.run }
      # WebMock.disable_net_connect!
    # end
  # end

  config.infer_spec_type_from_file_location!
  config.include AuthenticationHelper
end
