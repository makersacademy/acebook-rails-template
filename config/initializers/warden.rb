# frozen_string_literal: true

Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  manager.failure_app = proc { |_env|
    [
      '401',
      { 'Content-Type' => 'application/json' },
      { error: 'Unauthorized', code: 401 }
    ]
  }
  manager.default_strategies :password # needs to be defined
  # Optional Settings (see Warden wiki)
  # manager.scope_defaults :admin, strategies: [:password]
  # manager.default_scope = :admin # optional default scope
  # manager.intercept_401 = false # Warden will intercept 401 responses,
  # which can cause conflicts

  # module Devise
  #   module Strategies
  #     class Password < Base
  #       def valid?
  #         params['email'] || params['password']
  #       end
  #
  #       def authenticate!
  #         u = User.authenticate(params['email'],
  #          params['password']) u.nil? ?
  #           fail!("Could not log in") : success!(u)
  #       end
  #     end
  #   end
  # end
end
