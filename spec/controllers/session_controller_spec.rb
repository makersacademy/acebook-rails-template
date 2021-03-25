# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before do
    @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
    @user.save
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { session: { email: @user.email, password: @user.password } }
      expect(response).to redirect_to(:root)
      # expect(signed_in?).to be true
    end
  end 

end 





# describe 'POST /' do
#   it 'responds with 200' do
#     post :create, params: { post: { message: 'Hello, world!' } }
#     expect(response).to redirect_to(posts_url)
#   end

#   it 'creates a post' do
#     post :create, params: { post: { message: 'Hello, world!' } }
#     expect(Post.find_by(message: 'Hello, world!')).to be
#   end
# end