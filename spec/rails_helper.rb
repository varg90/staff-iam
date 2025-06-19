# frozen_string_literal: true

require "spec_helper"

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"
require "test_prof/recipes/rspec/let_it_be"

Rails.root.glob("spec/support/**/*.rb").each { require it }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # it's a default value, but let's be explicit so no one will accidentally turn in on
  config.use_transactional_fixtures = false
  config.include FactoryBot::Syntax::Methods
  config.include Dry::Monads[:result]
  config.include GeneratorSpecSupport, type: :generator

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
