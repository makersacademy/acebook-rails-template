require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SigninHelper. For example:
#
# describe SigninHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

def user_sign_up 
  visit "/"
  fill_in "user_email", with: "test@test.com"
  fill_in "user_password", with: "testing123"
  fill_in "user_password_confirmation", with: "testing123"

  click_button "Sign up"
end

RSpec.describe SigninHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"
end
