# frozen_string_literal: true

class TrackedService < ApplicationRecord
  has_many :auth_entities, dependent: :destroy
  has_many :users, through: :auth_entities

  validates :name, presence: true
end
