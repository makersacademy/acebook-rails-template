require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
def add_user
  feature "User Sign Up", type: :feature do
    scenario "signing up" do
      visit "/users/sign_up"
      fill_in "user[email]", with: "dan@dan.com"
      fill_in "user[password]", with: "1234567"
      fill_in "user[password_confirmation]", with: "1234567"
      click_button
    end
  end
end

# RSpec.describe UsersHelper, type: :helper do
#   # pending "add some examples to (or delete) #{__FILE__}"
#
# end
