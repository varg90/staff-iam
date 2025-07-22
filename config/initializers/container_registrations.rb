# frozen_string_literal: true

Rails.application.config.to_prepare do
  Users::Container.register("user_repository") { Repositories::UsersRepository.new }
  Users::Container.register("validate_user.policies.email") { Policies::UserEmailPolicy.new }
end
