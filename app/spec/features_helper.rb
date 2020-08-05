  def signup
    visit "/"
      click_button "Sign Up"
      fill_in "user[email]", with: "test@test.com"
      fill_in "user[password]", with: "123456"
      click_button "Save User"
  end

  def login
    click_button "Login"
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "123456"
    click_button "Login"
  end
