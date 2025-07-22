# frozen_string_literal: true

module Users
  module Types
    include ::Dry.Types

    Email = String.constrained(format: /@/)
    Time = Instance(::Time)
  end
end
