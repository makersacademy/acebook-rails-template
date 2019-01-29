# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#validate" do
    it "email is present" do
      get :create, params: { users: { username: 'oss', email: '', password: '123' } }
      expect(User.valid?).to eq false
    end
  end
end
