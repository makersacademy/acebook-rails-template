def register
    visit '/sign_up'
    fill_in "user_firstname", with: "Toast"
    fill_in "user_surname", with: "Thorn"
    fill_in "user_birthday", with: "10/02/1991"
    fill_in "user_gender", with: "Male"
    fill_in "user_email", with: "toast@example.com"
    fill_in "user_password", with: "1234"
    click_button "Sign up"
end

def log_in
    visit "/sign_in"
    fill_in "Email", with: "toast@example.com"
    fill_in "Password", with: "1234"
    click_button "Sign in"
end
