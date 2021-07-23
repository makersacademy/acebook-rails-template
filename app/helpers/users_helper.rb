module UsersHelper
  def signup_login
    visit "/welcome"
    click_button "Sign Up"
    fill_in "Username", with: "jooomin"
    fill_in "Password", with: "123"
    click_button "Create User"
    click_button "Login"
    fill_in "Username", with: "jooomin"
    fill_in "Password", with: "123"
    click_button "Login"
  end
end
