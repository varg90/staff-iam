# frozen_string_literal: true

module Repositories
  class UsersRepository
    include ::Users::IUserRepository

    def find_or_creates(user:)
      record =
        ::Database::User.find_or_create_by!(email: user.email) do |u|
          u.assign_attributes(user.to_h)
        end
      Users::User.new(record.attributes)
    rescue ActiveRecord::ActiveRecordError => e
      e
    end
  end
end
