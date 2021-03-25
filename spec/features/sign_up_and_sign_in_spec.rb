require_relative "web_helpers.rb"

feature "signing up and signing in" do

  scenario "users can sign up" do
    sign_up_as_testy()
    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_link("New post")
    expect(page).to have_button("logout")
  end

  scenario "a signed-in user can sign out" do
    sign_up_as_testy_and_log_out
    visit('/')
    expect(page).to have_link("Sign up")
  end
  
  scenario "a signed up user can sign in" do
    sign_up_as_testy_and_log_out
    visit('/users/sign_in')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'Password123')
    click_button('Log in')
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_link("New post")
    expect(page).to have_button("logout")
  end

  scenario "a user tries to log in with an incorrect password" do
    sign_up_as_testy_and_log_out
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'Password')
    click_button('Log in')
    expect(page).to have_content("Invalid Email or password.")
  end

  scenario "a user who has not signed up tries to sign in" do
    visit('/users/sign_in')
    fill_in('Email', with: 'hello@hi.com')
    fill_in('Password', with: 'password')
    click_button('Log in')
    expect(page).to have_content("Invalid Email or password.")
  end

end