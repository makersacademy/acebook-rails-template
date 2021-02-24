# frozen_string_literal: true

module Helpers
  module SignUp
    def register
      visit '/'
      click_link 'Register'
      fill_in 'Name', with: 'Katy Day'
      fill_in 'Username', with: 'Katy_the_Magnificent'
      fill_in 'Email', with: 'email@example.com'
      fill_in 'Password', with: 'password123'
      fill_in 'Password confirmation', with: 'password123'
      click_button 'Sign up'
    end
  end
end
