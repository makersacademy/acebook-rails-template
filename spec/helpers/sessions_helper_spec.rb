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
  pending "add some examples to (or delete) #{__FILE__}"

end

def user_signup_helper
  visit '/'
  click_button 'Sign Up'
  fill_in 'user_email', with: 'test@test.com'
  fill_in 'user_password', with: 'test1234'
  click_button 'Create User'
end
