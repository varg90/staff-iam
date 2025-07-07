# frozen_string_literal: true

class UserChannel < ApplicationCable::Channel
  def subscribed
    user = User.find(params[:id])
    stream_from "user:#{user.id}"

    transmit(
      { type: "user_info", id: user.id, email: user.email, role: user.role }
    )
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
