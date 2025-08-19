# frozen_string_literal: true

module Users
  module Operations
    class CreateUser < BaseService
      include Import["validate_user", "user_repository"]

      def call(email:)
        user = User.new(email:)
        yield validate_user.call(user:)

        case user_repository.find_or_create(user:)
        in ::Users::User => u
          Success(u)
        in StandardError => e
          Failure[:user_not_created, e]
        end
      end
    end
  end
end
