module Helpers
  module Registration
    def register_user(email = 'test@test.com', password = 'test1234', name = 'Test')
      visit '/users/new'
      fill_in 'user[email]', with: email
      fill_in 'user[name]', with: name
      fill_in 'user[password]', with: password
      click_button 'Create User'
    end
  end
end