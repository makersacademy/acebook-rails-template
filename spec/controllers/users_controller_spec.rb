# require 'rails_helper'
#
# RSpec.describe UsersController, type: :controller do
#
#   let(:user) { create(:user) }
#
#   before(:all) do
#     FactoryBot.define do
#       factory :user do
#         email { "beep@example.com" }
#         password { "aaa100aaa" }
#       end
#     end
#   end
#
#   before(:each) do
#     sign_in user
#   end
#
#    describe "GET /user/:id" do
#      it "responds with 200" do
#
#        get :wall
#        expect(response).to have_http_status(200)
#      end
#    end
#  end
