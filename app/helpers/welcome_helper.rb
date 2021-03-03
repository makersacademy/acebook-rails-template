module WelcomeHelper

  def sign_up
    visit("/")
    click_link("Register")
    fill_in "Username", with: 'name'
    fill_in "Email", with: 'example@example.com'
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    save_and_open_page
    click_button("Sign up")
  end

end
