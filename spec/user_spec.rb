require 'user.rb'
describe User do
  before(:each) do
    @user = User.create(name: 'testing', dob: '2020-04-04', cob: 'england', mob: 999, email: 'test@test.com', password: 'password')
  end

  describe "#create" do

    it 'Can create a new user' do
      expect(@user.email).to eq 'test@test.com'
      expect(@user.name).to eq 'testing'
      # expect(@user.dob).to eq "Sat, 04 Apr 2020"
      expect(@user.cob).to eq 'england'
    end
  end

end