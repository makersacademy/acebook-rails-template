require_relative "web_helpers.rb"

feature "signing up and signing in" do

  scenario "users can sign up" do
    sign_up_as_testy()
    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_link("New post")
    expect(page).to have_button("logout")
  end

  scenario "a signed-in user can sign out" do
    sign_up_as_testy()
    click_button("logout")
    visit('/')
    expect(page).to have_link("Sign up")
  end
  
  scenario "a signed up user can sign in"
end