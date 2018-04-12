# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do

before (:each) do
 @user = User.create!({
   :email => 'user@test.com',
   :password => 'please',
   :password_confirmation => 'please'
   })
 sign_in @user
end

 describe "GET /new " do
   it "responds with 200" do
     get :new
     expect(response).to have_http_status(200)
   end
 end

 describe 'POST' do
   context "a valid post to delete" do
     it "deletes a valid post" do
       post :create, params: { post: { message: "Hello World!"}}
       post :destroy, params: { id: Post.last.id }
       expect(Post.all.count).to eq(0)
     end
   end
 end
end
