# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      # TODO: replace the current_user
      self.current_user = User.first
    end
  end
end
