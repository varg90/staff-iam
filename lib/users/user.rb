# frozen_string_literal: true

module Users
  class User < ::Dry::Struct
    attribute :email, Types::Email
    attribute? :name, Types::String

    attribute? :created_at, Types::Time.optional
    attribute? :updated_at, Types::Time.optional
  end
end
