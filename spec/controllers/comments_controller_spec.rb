# frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe CommentsController, type: :controller do
#  before do
#     @user = FactoryBot.create(:user)
#     sign_in_as(@user)
#     post :create, params: { post: { message: 'Hello, world!' } }
#  end

#   describe "GET #index" do
#     it "returns a success response" do
#       post :create, params: { post: { message: 'Hello, world!' } }
#       Comment.create! valid_attributes
#       get :index, params: {}, session: valid_session
#       expect(response).to be_successful
#     end
#   end

#   describe "GET #show" do
#     it "returns a success response" do
#       comment = Comment.create! valid_attributes
#       get :show, params: {id: comment.to_param}, session: valid_session
#       expect(response).to be_successful
#     end
#   end

#   describe "GET #new" do
#     it "returns a success response" do
#       get :new, params: {}, session: valid_session
#       expect(response).to be_successful
#     end
#   end

#   describe "GET #edit" do
#     it "returns a success response" do
#       comment = Comment.create! valid_attributes
#       get :edit, params: {id: comment.to_param}, session: valid_session
#       expect(response).to be_successful
#     end
#   end

#   describe "POST #create" do
#     context "with valid params" do
#       it "creates a new Comment" do
#         expect {
#           post :create, params: {comment: valid_attributes}, session: valid_session
#         }.to change(Comment, :count).by(1)
#       end

#       it "redirects to the created comment" do
#         post :create, params: {comment: valid_attributes}, session: valid_session
#         expect(response).to redirect_to(Comment.last)
#       end
#     end

#     context "with invalid params" do
#       it "returns a success response (i.e. to display the 'new' template)" do
#         post :create, params: {comment: invalid_attributes}, session: valid_session
#         expect(response).to be_successful
#       end
#     end
#   end

#   describe "PUT #update" do
#     context "with valid params" do
#       let(:new_attributes) {
#         skip("Add a hash of attributes valid for your model")
#       }

#       it "updates the requested comment" do
#         comment = Comment.create! valid_attributes
#         put :update, params: {id: comment.to_param, comment: new_attributes}, session: valid_session
#         comment.reload
#         skip("Add assertions for updated state")
#       end

#       it "redirects to the comment" do
#         comment = Comment.create! valid_attributes
#         put :update, params: {id: comment.to_param, comment: valid_attributes}, session: valid_session
#         expect(response).to redirect_to(comment)
#       end
#     end

#     context "with invalid params" do
#       it "returns a success response (i.e. to display the 'edit' template)" do
#         comment = Comment.create! valid_attributes
#         put :update, params: {id: comment.to_param, comment: invalid_attributes}, session: valid_session
#         expect(response).to be_successful
#       end
#     end
#   end

#   describe "DELETE #destroy" do
#     it "destroys the requested comment" do
#       comment = Comment.create! valid_attributes
#       expect {
#         delete :destroy, params: {id: comment.to_param}, session: valid_session
#       }.to change(Comment, :count).by(-1)
#     end

#     it "redirects to the comments list" do
#       comment = Comment.create! valid_attributes
#       delete :destroy, params: {id: comment.to_param}, session: valid_session
#       expect(response).to redirect_to(comments_url)
#     end
#   end

# end
