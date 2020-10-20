describe UserManagement, type: :model do

    let(:user) { User.new(email: "test@test.com", password: "batman98!", first_name: "Bruce", last_name: "Wayne") }

    it "can create a user" do
        user = UserManagement.new.create(email: "test@test.com", password: "batman98!", first_name: "Bruce", last_name: "Wayne")
        expect(user).to be_an_instance_of User
    end


end

