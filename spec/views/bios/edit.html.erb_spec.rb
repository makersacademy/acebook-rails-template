# require 'rails_helper'
#
# RSpec.describe "bios/edit", type: :view do
#   before(:each) do
#     @bio = assign(:bio, Bio.create!(
#       :age => 1,
#       :bio => "MyText",
#       :location => "MyText"
#     ))
#   end
#
#   it "renders the edit bio form" do
#     render
#
#     assert_select "form[action=?][method=?]", bio_path(@bio), "post" do
#
#       assert_select "input[name=?]", "bio[age]"
#
#       assert_select "textarea[name=?]", "bio[bio]"
#
#       assert_select "textarea[name=?]", "bio[location]"
#     end
#   end
# end
