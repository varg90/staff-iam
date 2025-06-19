# frozen_string_literal: true

Dry::Rails.container do
  config.features = %i[application_contract safe_params controller_helpers]

  config.component_dirs.memoize = true
  config.component_dirs.auto_register = ->(component) do
    !component.identifier.key.start_with?("application_")
  end

  config.component_dirs.add "app/services"
  config.component_dirs.add "app/jobs" do |dir|
    dir.instance = ->(component) { component.loader.constant(component) }
  end
end
