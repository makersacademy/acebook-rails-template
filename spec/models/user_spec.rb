require './app/models/user.rb'

describe User, type: :model do
  
  let(:user) { User.new(email: "test@test.com", password: "batman98!", first_name: "Bruce", last_name: "Wayne") }

 
  it 'instantiates with the above' do
    expect(user.email).to eq("test@test.com")
    expect(user.password).to eq("batman98!")
    expect(user.first_name).to eq("Bruce")
    expect(user.last_name).to eq("Wayne")
  end

  


end
