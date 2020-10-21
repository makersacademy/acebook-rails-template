module Helpers
  module Authentication
    def sign_up
      visit "/welcome"
      click_button "Sign Up"
      fill_in "Name", with: "Bob"
      fill_in "Email", with: "bob@test.com"
      fill_in "Password", with: "Bobobob"
      click_button "Create User"
    end

    def sign_up_log_in
      visit "/welcome"
      click_button "Sign Up"
      fill_in "Name", with: "Bob"
      fill_in "Email", with: "bob@test.com"
      fill_in "Password", with: "Bobobob"
      click_button "Create User"
      click_link "Log out"
      click_button "Log In"
      fill_in "Email", with: "bob@test.com"
      fill_in "Password", with: "Bobobob"
      click_button "Login"
    end

    def log_in
      visit "/welcome"
      click_button "Log In"
      fill_in "Email", with: "bob@test.com"
      fill_in "Password", with: "Bobobob"
      click_button "Login"
    end
  end
end
