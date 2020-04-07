require 'user.rb'
describe User do

  describe "#create" do
    it 'Can create a new user' do
      user = User.create(name: 'testing', dob: '04/04/20', cob: 'england', mob: 999, email: 'test@test.com', password: 'password')
      expect(user.email).to eq 'test@test.com'
      expect(user.name).to eq 'testing'
      expect(user.dob).to eq '04/04/20'
      expect(user.cob).to eq 'england'
    end
  end
end