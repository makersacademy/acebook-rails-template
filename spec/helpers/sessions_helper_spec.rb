require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do

  def user_sign_up
    visit "/users/sign_up"
    fill_in "user_username", with: "Bob"
    fill_in "user_email", with: "bob@example.com"
    fill_in "user_password", with: "password1!"
    fill_in "user_password_confirmation", with: "password1!"
    click_button "Sign up"
  end

end