require_relative 'rails_helper'

def new_login(testemail, testpassword)
  visit "/users/sign_in"
  fill_in "user[email]", with: testemail
  fill_in "user[password]", with: testpassword
  click_button ("Sign In")
end

