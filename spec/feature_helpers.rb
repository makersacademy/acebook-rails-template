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
def register_2
    visit '/sign_up'
    fill_in "user_firstname", with: "Bagel"
    fill_in "user_surname", with: "Tree"
    fill_in "user_birthday", with: "11/04/1891"
    fill_in "user_gender", with: "Female"
    fill_in "user_email", with: "bagel@example.com"
    fill_in "user_password", with: "1234"
    click_button "Sign up"
end

def log_in_2
    visit "/sign_in"
    fill_in "Email", with: "bagel@example.com"
    fill_in "Password", with: "1234"
    click_button "Sign in"
end

def post_something
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
  expect(page).to have_content("Hello, world!")
end
