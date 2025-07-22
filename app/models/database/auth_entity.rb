# frozen_string_literal: true

module Database
  class AuthEntity < ApplicationRecord
    belongs_to :user
    belongs_to :tracked_service

    validates :identifier, presence: true
    validates :access_level, presence: true
    validates :active, presence: true
  end
end
