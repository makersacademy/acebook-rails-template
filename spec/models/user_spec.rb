require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# describe '.create' do
#   it 'creates a new user profile' do
#   user = User.create(username: 'test@test.com', password: 'password')
#   expect(user).to be_a User
#   expect(user.username).to eq 'test@test.com'
#   end
# end
#
# describe '.authenticate' do
#   it 'returns a user given a correct username and password, if one exists' do
#     user = User.create(email: 'test@example.com', password: 'password123')
#     authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')
#     expect(authenticated_user.id).to eq user.id
#   end
# end
