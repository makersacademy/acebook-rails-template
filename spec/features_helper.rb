  def signup
    visit "/"
      click_button "Sign Up"
      fill_in "user[email]", with: "test@test.com"
      fill_in "user[password]", with: "123456"
      click_button "Save User"
  end