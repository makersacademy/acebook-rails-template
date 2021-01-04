
module Helpers
  module Authentication
    def register
      visit '/'
      click_link 'Register'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Name', with: 'Test123'
      fill_in 'Password', with: 'Test123'
      fill_in 'Password confirmation', with: 'Test123'
      click_button 'Sign up'
    end

    def user_two
      visit '/'
      click_link 'Register'
      fill_in 'Email', with: 'testy@testy.com'
      fill_in 'Name', with: 'Testy123'
      fill_in 'Password', with: 'Testy123'
      fill_in 'Password confirmation', with: 'Testy123'
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
