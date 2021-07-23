require 'rails_helper'

# # Specs in this file have access to a helper object that includes
# # the UsersHelper. For example:
# #
# # describe UsersHelper do
# #   describe "string concat" do
# #     it "concats two strings with spaces" do
# #       expect(helper.concat_strings("this","that")).to eq("this that")
# #     end
# #   end
# # end
# RSpec.describe UsersHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
module Helpers
  module Authentication
    def signup_login
      visit "/welcome"
      click_button "Sign Up"
      fill_in "Username", with: "jooomin"
      fill_in "Password", with: "123"
      click_button "Create User"
      click_button "Login"
      fill_in "Username", with: "jooomin"
      fill_in "Password", with: "123"
      click_button "Login"
    end
  end
end
