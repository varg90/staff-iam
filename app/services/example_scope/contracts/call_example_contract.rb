# frozen_string_literal: true

module ExampleScope
  module Contracts
    class CallExampleContract < ApplicationContract
      params do
        # required(:email).filled(:string)
        # optional(:age).maybe(:integer)
      end
    end
  end
end
