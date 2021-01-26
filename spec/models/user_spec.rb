require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be }

  it 'creates a new instance of the User class' do
    user = User.new 
    expect(user).to be_instance_of(User)
  end
end
