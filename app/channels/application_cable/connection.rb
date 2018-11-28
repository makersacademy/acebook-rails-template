module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.name
    end

    protected

    def find_verified_user
      verified_user = env['warden'].user
      return verified_user if verified_user
      reject_unauthorized_connection
    end
  end
end
