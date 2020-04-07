require 'user.rb'
describe User do
  before(:each) do
    @user = User.create(name: 'testing', dob: '04/04/20', cob: 'england', mob: 999, email: 'test@test.com', password: 'password')
  end

  describe "#create" do

    it 'Can create a new user' do
      expect(@user.email).to eq 'test@test.com'
      expect(@user.name).to eq 'testing'
      expect(@user.dob).to eq '04/04/20'
      expect(@user.cob).to eq 'england'
    end

    it 'cannot register if the email address already exists in the database' do
      expect{User.create(name: 'testing', dob: '04/04/20', cob: 'england', mob: 999, email: 'test@test.com', password: 'password')}.to raise_error "E-mail address already exists"  
    end
  end

  describe "#login" do
    it 'truth if email and password are a match in the database' do
      expect(User.login(email: 'test@test.com', password: 'password')).to be_truthy
    end
    it 'falsy if email and password are a match in the database' do
      expect(User.login(email: 'test@test.comm', password: 'password')).to be_falsy
    end
  end

end