# frozen_string_literal: true

module Users
  class Container < BaseContainer
    # Register implementations for these:
    register("user_repository", default: true) { IUserRepository.new }

    register("validate_user") { ValidateUser.new(policies: all(/\Avalidate_user\.policies\./)) }
    # You can register callable, dry-monads compatible objects as pluggable validation policies.

    register("operations.create_user") { Operations::CreateUser.new }
  end

  Import = ::Dry::AutoInject(Container)
end
