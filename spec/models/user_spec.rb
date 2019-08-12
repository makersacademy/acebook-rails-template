require 'rails_helper'

RSpec.describe User, type: :model do

  describe '.create' do
    it 'creates a valid user' do
      @user = User.create({username: "Example User", email: "user@example.com"})
      assert @user.valid?
    end

    it 'name should be present' do
      @user = User.create({username: "      ", email: "user@example.com"})
      assert !@user.valid?
    end
  end
end

