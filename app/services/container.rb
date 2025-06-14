# frozen_string_literal: true

class Container < Dry::System::Container
  configure do |config|
    config.root = Rails.root.to_s.freeze
    config.component_dirs.add "app/services", memoize: true
  end
end
