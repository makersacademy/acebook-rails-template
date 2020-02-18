# frozen_string_literal: true

require 'rails_helper'

def sign_up
  visit '/'
  click_on 'Sign Up'
  fill_in 'user[email]', with: 'Ria@testing.com'
  fill_in 'user[password]', with: 'password'
  fill_in 'user[password_confirmation]', with: 'password'
  click_on 'Sign Up'
end
