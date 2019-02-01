# require 'rails_helper'
#
# RSpec.describe UsersController, type: :controller do
#   describe 'GET /index ' do
#     it 'responds with 200' do
#       get :index
#       expect(response).to have_http_status(200)
#     end
#   end
#
#   describe 'POST /' do
#     it 'responds with 200' do
#       post :create, params: { user: { first_name: 'Tom', last_name: 'Lawrence', birthday: '2000-01-01', password: 'nerds', gender: 'Male', email: 'tom@hotmail.com' } }
#       expect(response).to redirect_to(users_profile_url)
#     end
#
#     it 'creates a user' do
#       post :create, params: { user: { first_name: 'Tom', last_name: 'Lawrence', birthday: '2000-01-01', password: 'nerds', gender: 'Male', email: 'tom@hotmail.com' } }
#       expect(User.find_by(first_name: 'Tom')).to be
#     end
#   end
# end
