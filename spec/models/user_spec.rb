require 'rails_helper'

RSpec.describe User, type: :model do



  it 'should be a valid user' do
    @user = User.new(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "john123456")
    assert @user.valid?
  end

  it 'should have a valid first name' do
    @user = User.new(first_name: "", last_name: "Doe", email: "john@doe.com", password: "john123456")
    assert !(@user.valid?)
  end

end
