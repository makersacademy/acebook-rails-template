module Helpers
  module Registration
    def register_user(email = 'test@test.com')
      visit '/users/new'
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: 'test1234'
      click_button 'Create User'
    end
  end
end