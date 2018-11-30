# frozen_string_literal: true

require 'rails_helper'




# RSpec.describe SessionsController, type: :request do
#   before :each do
#     FactoryBot.create(:user, email: "jeff@hotmail.com", password: "password1")
#   end
#   before { post "/login", params: { session: { email: 'jeff@hotmail.com', password: 'password1' } } }
#
#   describe 'POST /' do
#     it 'responds with 200' do
#       expect(json['email']).to eq("jeff@hotmail.com")
#     end
#   end
#
#   describe 'DELETE /' do
#     before { get "/logout" }
#
#     it 'responds with 200' do
#       expect(json["message"]).to eq("logged out")
#     end
#
#   end
#
# end


# # I've called it authentication_test_spec.rb and placed it in the spec/requests folder
# require 'rails_helper'
# include ActionController::RespondWith
# ​
# # The authentication header looks something like this:
# # {"access-token"=>"abcd1dMVlvW2BT67xIAS_A", "token-type"=>"Bearer", "client"=>"LSJEVZ7Pq6DX5LXvOWMq1w", "expiry"=>"1519086891", "uid"=>"darnell@konopelski.info"}
# ​
# describe 'Whether access is ocurring properly', type: :request do
#   before(:each) do
#     @current_user = FactoryBot.create(:user)
#     @client = FactoryBot.create :client
#   end
# ​
#   context 'context: general authentication via API, ' do
#     it "doesn't give you anything if you don't log in" do
#       get api_client_path(@client)
#       expect(response.status).to eq(401)
#     end
# ​
#     it 'gives you an authentication code if you are an existing user and you satisfy the password' do
#       login
#       # puts "#{response.headers.inspect}"
#       # puts "#{response.body.inspect}"
#       expect(response.has_header?('access-token')).to eq(true)
#     end
# ​
#     it 'gives you a status 200 on signing in ' do
#       login
#       expect(response.status).to eq(200)
#     end
# ​
#     it 'gives you an authentication code if you are an existing user and you satisfy the password' do
#       login
#       expect(response.has_header?('access-token')).to eq(true)
#     end
# ​
#     it 'first get a token, then access a restricted page' do
#       login
#       auth_params = get_auth_params_from_login_response_headers(response)
#       new_client = FactoryBot.create(:client)
#       get api_find_client_by_name_path(new_client.name), headers: auth_params
#       expect(response).to have_http_status(:success)
#     end
# ​
#     it 'deny access to a restricted page with an incorrect token' do
#       login
#       auth_params = get_auth_params_from_login_response_headers(response).tap do |h|
#         h.each do |k, _v|
#           if k == 'access-token'
#             h[k] = '123'
#           end end
#       end
#       new_client = FactoryBot.create(:client)
#       get api_find_client_by_name_path(new_client.name), headers: auth_params
#       expect(response).not_to have_http_status(:success)
#     end
#   end
# ​
#   RSpec.shared_examples 'use authentication tokens of different ages' do |token_age, http_status|
#     let(:vary_authentication_age) { token_age }
# ​
#     it 'uses the given parameter' do
#       expect(vary_authentication_age(token_age)).to have_http_status(http_status)
#     end
# ​
#     def vary_authentication_age(token_age)
#       login
#       auth_params = get_auth_params_from_login_response_headers(response)
#       new_client = FactoryBot.create(:client)
#       get api_find_client_by_name_path(new_client.name), headers: auth_params
#       expect(response).to have_http_status(:success)
# ​
#       allow(Time).to receive(:now).and_return(Time.now + token_age)
# ​
#       get api_find_client_by_name_path(new_client.name), headers: auth_params
#       response
#     end
#   end
# ​
#   context 'test access tokens of varying ages' do
#     include_examples 'use authentication tokens of different ages', 2.days, :success
#     include_examples 'use authentication tokens of different ages', 5.years, :unauthorized
#   end
# ​
#   def login
#     post api_user_session_path, params:  { email: @current_user.email, password: 'password' }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
#   end
# ​
#   def get_auth_params_from_login_response_headers(response)
#     client = response.headers['client']
#     token = response.headers['access-token']
#     expiry = response.headers['expiry']
#     token_type = response.headers['token-type']
#     uid = response.headers['uid']
# ​
#     auth_params = {
#       'access-token' => token,
#       'client' => client,
#       'uid' => uid,
#       'expiry' => expiry,
#       'token_type' => token_type
#     }
#     auth_params
#   end
# end
