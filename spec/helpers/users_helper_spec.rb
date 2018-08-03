require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
def sign_up_test
  visit '/users/sign_in'
  click_link 'Sign up'
  email = 'test@test.com'
  fill_in 'user_username', with: 'test'
  fill_in 'user_email', with: email
  fill_in 'user_password', with: 'hello1'
  fill_in 'user_password_confirmation', with: 'hello1'
  click_on 'Sign up'
end

RSpec.describe UsersHelper, type: :helper do
  # pending "add some examples to (or delete) #{__FILE__}"
end
