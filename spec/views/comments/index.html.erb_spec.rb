# frozen_string_literal: true

# require 'rails_helper'
# require 'clearance/rspec'

# RSpec.describe "comments/index", type: :view do
#   before(:each) do
#     @user = FactoryBot.create(:user)
#     sign_in_as(@user)
#     Post.new('Hello, world!')
#     assign(:comments, [
#       Comment.create!(
#         :commenter => "Commenter",
#         :body => "MyText",
#         :post => 'Hello, world!'
#       ),
#       Comment.create!(
#         :commenter => "Commenter",
#         :body => "MyText",
#         :post => 'Hello, world!'
#       )
#     ])
#   end

#   it "renders a list of comments" do
#     render
#     assert_select "tr>td", :text => "Commenter".to_s, :count => 2
#     assert_select "tr>td", :text => "MyText".to_s, :count => 2
#     assert_select "tr>td", :text => 'Hello, world!'.to_s, :count => 2
#   end
# end
