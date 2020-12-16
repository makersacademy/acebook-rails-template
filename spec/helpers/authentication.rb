
module Helpers
  module Authentication
    def register
      visit '/'
      click_link 'Register'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'Test123'
      fill_in 'Password confirmation', with: 'Test123'
      click_button 'Sign up'
    end

    def sign_in
      visit '/'
      click_link 'Sign In'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'Test123'
      click_button 'Log in'
    end
  end
end
