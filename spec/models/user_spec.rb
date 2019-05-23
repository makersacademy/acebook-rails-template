require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'email' do
    it 'makes sure email is unique' do
      user = User.new(email: 'example@gmail.com', password: '12345')
      user.save

      u = User.new(email: 'example@gmail.com', password: '12345' )
      u.save
      expect(u.errors.messages[:email][0]).to eq("has already been taken")
    end
  end
end
