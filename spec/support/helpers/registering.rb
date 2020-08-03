module Helpers
  module Registration
    def register_user
      visit '/users/new'
      fill_in 'user[email]', with: 'test@test.com'
      fill_in 'user[password]', with: 'test1234'
      click_button 'Create User'
    end
  end
end