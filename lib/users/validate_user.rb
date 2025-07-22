# frozen_string_literal: true

module Users
  class ValidateUser < BaseService
    option :policies, default: -> { ::Dry::Core::EMPTY_ARRAY }

    # @param user [Users::User]
    # @return [Dry::Monads::Result]
    def call(user:)
      yield check_class(user)
      yield check_policies(user)
      Success(user)
    end

    private

    def check_class(user)
      return Success() if user.is_a?(User)

      Failure(:not_a_user)
    end

    def check_policies(user)
      policies.each { yield it.call(user:) }
      Success()
    end
  end
end
