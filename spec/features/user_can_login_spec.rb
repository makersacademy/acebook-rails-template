RSpec.feature "Logging in", type: :feature do
  before(:each) do
    visit "/"
    click_link "Sign Up"
    fill_in "user_firstname", with: "testfirstname"
    fill_in "user_lastname", with: "testlastname"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User"
  end

  scenario "Can login to an existing account" do
    expect(page).to have_current_path("/")
    fill_in "email", with: "test@gmail.com"
    fill_in "password", with: "123456"
    click_button "Login"
    expect(page).to have_current_path("/posts")
  end

  scenario "Encounters error when logging in with invalid credentials" do
    expect(page).to have_current_path("/")
    fill_in "email", with: "wrong@gmail.com"
    fill_in "password", with: "1234567"
    click_button "Login"
    expect(page).to have_current_path("/")
    expect(page).to have_content("Email or password is invalid")
  end

  scenario "Finds a tailored welcome message" do
    fill_in "email", with: "test@gmail.com"
    fill_in "password", with: "123456"
    click_button "Login"
    expect(page).to have_content("Hello, testfirstname.")
  end
end