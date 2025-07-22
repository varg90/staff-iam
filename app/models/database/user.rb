# frozen_string_literal: true

module Database
  class User < ApplicationRecord
    has_many :auth_entities, dependent: :destroy
    has_many :tracked_services, through: :auth_entities

    validates :email, presence: true
    has_secure_password
  end
end
