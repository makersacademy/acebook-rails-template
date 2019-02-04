# require 'rails_helper'

# RSpec.describe SessionsController, type: :controller do

#   describe 'POST /sessions' do

#     context 'After sign up' do
#       post :create, params: { user: { first_name: 'Tom', last_name: 'Lawrence', birthday: '2000-01-01', password: 'nerds123', gender: 'Male', email: 'tom@hotmail.com' } }
    
#       it 'responds with 200' do
#         post :create, params: { user: { email: 'tom@hotmail.com', password: 'nerds123', gender: 'Male',  } }
#         expect(response).to redirect_to(posts_url)
#       end

#       it 'creates a user' do
#         post :create, params: { user: { first_name: 'Tom', last_name: 'Lawrence', birthday: '2000-01-01', password: 'nerds123', gender: 'Male', email: 'tom@hotmail.com' } }
#         expect(User.find_by(first_name: 'Tom')).to be
#       end
#     end
#   end
# end
