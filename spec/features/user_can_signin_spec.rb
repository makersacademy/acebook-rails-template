RSpec.feature "Sign in", type: :feature do
    scenario "user can sign in with email and password" do
        sign_up_bob
        click_link "Logout"
        click_link "Login"
        user_email = "bob@bob.com"
        user_password = "1234567890"
        fill_in "Email", with: user_email
        fill_in "Password", with: user_password
        click_button "Log in"
        expect(page).to have_content("Signed in successfully.")
        expect(page).to have_content("Logged in as #{user_email}.")
    end
end