# frozen_string_literal: true

# Has to be required first, or we won't even be able to load the generator class.
require "rails/generators"

# @see Rails::Generators::TestCase
module GeneratorSpecSupport
  extend ActiveSupport::Concern

  included do
    require "rails/generators/testing/behavior"

    include Rails::Generators::Testing::Behavior
    include FileUtils

    around do |example|
      # `run_generator` helper needs this.
      self.class.generator_class = described_class
      # Run generator in a temporary directory:
      Dir.mktmpdir("generator_test_", "tmp") do |dir|
        self.class.destination dir
        example.run
      end
    end

    # cd to expected directory in case it was changed.
    before { ensure_current_path }
    after { ensure_current_path }
  end

  # Return "root" used to generate files, i.e. what would normally be Rails.root.
  def root
    Pathname.new(destination_root)
  end
end
