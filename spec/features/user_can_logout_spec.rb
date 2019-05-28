RSpec.feature "Can log out", type: :feature do
    scenario "user can log out after they have logged in" do
      first_name = 'Bob'
      last_name = 'Geldof'
      email = 'its.me@bobgeldof.com'
      password = 'bob123'

      visit "/users/new"
      fill_in('user[first_name]', with: first_name)
      fill_in('user[last_name]', with: last_name)
      fill_in('user[email]', with: email)
      fill_in('user[password]', with: password)
      click_button('Signup')
      fill_in('session[email]', with: email)
      fill_in('session[password]', with: password)
      click_button('Log in')
      expect(page).to have_content 'New post'
      click_link('Log out')
      expect(page).to have_selector("input[type=submit][value='Log in']")
  end
end
