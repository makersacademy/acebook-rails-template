require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  describe '#log_in' do
    it 'assigns user_id to session user_id' do
      user = User.new(first_name: 'Bob', last_name: 'Bear', email: 'bob@bear.com', password: 'bobby')
      log_in(user)
      expect(session[:user_id]).to eq user.id
    end
  end
end
