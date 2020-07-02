
require 'rails_helper'
 
RSpec.describe UsersController, type: :controller do
 
xdescribe "POST /" do
    it "creates a post" do
       post :create, params: { user: {name: "John", email: 'test@hello.com', password_digest: 'pass' }}
       expect(User.find_by(name: "John")).to be
       expect(User.find_by(password_digest: 'pass')).to be
       expect(User.find_by(email: "test@hello.com")).to be

     end
end
 
end



