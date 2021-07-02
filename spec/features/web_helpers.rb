def successfullogin
    User.create(username: "login", email: "login@example.com", password: "1234", password_confirmation: "1234")
    visit "/login"
    fill_in "session[email]", with: "login@example.com"
    fill_in "session[password]", with: "1234"
    click_button "Log in"
end