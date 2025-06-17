# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Add helper methods for authentication.
  include RailsWarden::Authentication

  # Temporarily use any user to authenticate.
  # TODO: Replace with actual sessions.
  before_action :temp_set_user

  before_action :check_authorization

  private

  def temp_set_user
    return if user

    admin = User.first or raise "Create admin user to run this app"
    login!(admin, scope: :user)
  end

  def check_authorization
    authenticate!
  end
end
