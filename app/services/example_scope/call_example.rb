# frozen_string_literal: true

module ExampleScope
  class CallExample < ApplicationService
    include StaffIam::Deps[contract: "example_scope.contracts.call_example_contract"]

    # @param params [Hash]
    # @return [Dry::Monads::Result]
    def call(params:); end
  end
end
