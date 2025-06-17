# frozen_string_literal: true

Warden::Strategies.add(:password) do
  def valid?
    params["login"] || params["password"]
  end

  def authenticate!
    access_granted =
      if (user = User.find_by(email: params["login"]))
        user.authenticate(params["password"])
      else
        # Compare to a completely random password to waste time and prevent timing-based attacks.
        result =
          BCrypt::Password.new("$2a$12$r.d.0EcomoBScMpE75pFGeAcd0MM2wYiFRRm7W4KTP0E7NbP61T1a") ==
          params["password"]
        result && false
      end

    if access_granted
      success!(user)
    else
      fail!
    end
  end
end

Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  manager.failure_app = proc do |_env|
    ["401", { "Content-Type" => "text/plain" }, "🖕"]
  end
  manager.default_strategies :password # needs to be defined
  manager.default_scope = :user # optional default scope
  # Optional Settings (see Warden wiki)
  # manager.scope_defaults :admin, strategies: [:password]
  # manager.intercept_401 = false # Warden will intercept 401 responses, which can cause conflicts
end
