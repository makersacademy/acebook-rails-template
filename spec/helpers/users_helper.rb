require 'rails_helper'
require 'spec_helper'

def sign_up
  visit '/login'
  fill_in 'sign_up_name', with: 'Sassy'
  fill_in 'sign_up_email', with: 'sassy@makers.com'
  fill_in 'sign_up_password', with: '123456'
  click_button 'Sign Up'
end

def sign_in
  visit '/login'
  fill_in 'sign_in_email', with: 'sassy@makers.com'
  fill_in 'sign_in_password', with: '123456'
  click_button 'Log In'
end

#
# RSpec.describe UsersHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
