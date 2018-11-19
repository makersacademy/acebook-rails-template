require 'rails_helper'


RSpec.describe User, type: :model do
  before do
    @user = User.new(name:'Example', email:'user@example.com')
  end
  it 'should be valid' do
    expect(@user.valid?).to eq(true)
  end
  it 'name should be present' do
    @user.name = ""
    expect(@user.valid?).to eq(false)
  end
  it 'name should not be too long' do
    @user.name = "n" * 51
    expect(@user.valid?).to eq(false)
  end
  it 'email should be present' do
    @user.email = ""
    expect(@user.valid?).to eq(false)
  end
  it 'email should not be too long' do
    @user.email = "n" * 244 + '@example.com'
    expect(@user.valid?).to eq(false)
  end

  it 'should accept a valid email address' do
    @user.email = "someuser@example.com"
    expect(@user.valid?).to eq(true)
  end
  it "should not accept invalid email" do
    @user.email = "some.@example.@.com"
      expect(@user.valid?).to eq(false)
    end
  end
