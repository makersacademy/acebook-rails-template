def signup
    visit "/"
    click_link "Sign Up"
    # fill_in "Username", with: "mrtester"
    fill_in "Email", with: "mrtester@test.com"
    fill_in "Password", with: "test123"
    fill_in "Password confirmation", with: "test123"
    click_button "Sign Up"
  end