# frozen_string_literal: true

module Users
  module IUserRepository
    include Interface

    # @param user [Users::User]
    # @return [Users::User]
    def find_or_create(user:)
      not_implemented
    end
  end
end
