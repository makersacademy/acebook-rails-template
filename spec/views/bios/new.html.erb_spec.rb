# require 'rails_helper'
#
# RSpec.describe "bios/new", type: :view do
#   before(:each) do
#     assign(:bio, Bio.new(
#       :age => 1,
#       :bio => "MyText",
#       :location => "MyText"
#     ))
#   end
#
#   it "renders new bio form" do
#     render
#
#     assert_select "form[action=?][method=?]", bios_path, "post" do
#
#       assert_select "input[name=?]", "bio[age]"
#
#       assert_select "textarea[name=?]", "bio[bio]"
#
#       assert_select "textarea[name=?]", "bio[location]"
#     end
#   end
# end
