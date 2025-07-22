# frozen_string_literal: true

module Policies
  class UserEmailPolicy < ::BaseService
    def call(user:)
      return Success() if user.email.end_with?("@example.com")

      Failure[
        :policy_failed,
        ::I18n.t("policies.user_email_policy.policy_failed", email: user.email),
        user.email
      ]
    end
  end
end
