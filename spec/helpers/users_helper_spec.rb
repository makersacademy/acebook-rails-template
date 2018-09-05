require 'rails_helper'
require 'spec_helper'



def sign_up
  visit '/'
  fill_in 'user_name', with: 'Sassy'
  fill_in 'user_email', with: 'sassy@makers.com'
  fill_in 'user_password', with: '123456'
  click_button 'Sign Up'
end

def sign_in
  visit '/'
  fill_in 'email', with: 'sassy@makers.com'
  fill_in 'password', with: '123456'
  click_button 'Log In'
end




#
# RSpec.describe UsersHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
