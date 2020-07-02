# require 'rails_helper'

# RSpec.describe "users/index", type: :view do
#   before(:each) do
#     assign(:users, [
#       User.create!(
#         :firstname => "Firstname",
#         :lastname => "Lastname",
#         :email => "Email1@email.com",
#         :password => "123456"
#       ),
#       User.create!(
#         :firstname => "Firstname",
#         :lastname => "Lastname",
#         :email => "Email2@email.com",
#         :password => "123456"
#       )
#     ])
#   end

#   it "renders a list of users" do
#     render
#     assert_select "tr>td", :text => "Firstname".to_s, :count => 2
#     assert_select "tr>td", :text => "Lastname".to_s, :count => 2
#     assert_select "tr>td", :text => "Email".to_s, :count => 2
#     assert_select "tr>td", :text => "".to_s, :count => 2
#   end
# end
