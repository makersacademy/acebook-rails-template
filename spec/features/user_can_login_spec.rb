RSpec.feature "Logging in", type: :feature do
  before(:each) do
    visit "/"
    click_link "Sign Up"
    fill_in "First Name", with: "Al"
    fill_in "Last Name", with: "Sumner"
    fill_in "Email", with: "al@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Confirm Password", with: "123456"
    click_button "Create User"
  end
  scenario "Can login to an existing account" do
    expect(page).to have_current_path("/")
    fill_in "Email", with: "al@gmail.com"
    fill_in "Password", with: "123456"
    click_button "Login"
    expect(page).to have_current_path("/posts")
  end
end