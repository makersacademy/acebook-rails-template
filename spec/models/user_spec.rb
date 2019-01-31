# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validate' do
    it "doesn't let you save a user without an email" do
      cont = UsersController.new
      user = User.new(username: 'test0001', email: '', password: '12345')
      expect(user.save).to eq false
    end

    it "doesn't let you save a user without a 5 character minimum password" do
      cont = UsersController.new
      user = User.new(username: 'test0001', email: 'test0001@makers.com', password: 'Pass')
      expect(user.save).to eq false
    end

    it "doesn't let you save a user without a unique email" do
      cont = UsersController.new
      user1 = User.new(username: 'test0001', email: 'test0001@makers.com', password: '12345')
      user2 = User.new(username: 'test0001', email: 'test0001@makers.com', password: '12345')
      expect(user1.save).to eq true
      expect(user2.save).to eq false
    end
  end
end
