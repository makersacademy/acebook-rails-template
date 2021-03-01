RSpec.feature 'Registration', type: :feature do
  scenario 'Users can sign up on the sign up page' do
    sign_up
    expect(page).to have_content('Welcome, Joe!')
  end

  scenario "Users can't sign up if email is already in database" do 
    sign_up
    sign_out
    sign_up
    expect(page).to have_content("Email joebloggs@test.com already exists. Please enter a new email address")
  end

  scenario 'Users can log in and see confirmation' do
    sign_up
    sign_out
    sign_in
    expect(page).to have_content("Logged in")
  end

  scenario 'Users can log out and see confirmation' do
    sign_up
    sign_out
    expect(page).to have_content("Logged out")
  end

  scenario "User can not sign in with invalid password or email" do
    sign_up
    sign_out
    visit 'sign_in'
    fill_in 'email', with: 'joebloggs@test.com'
    fill_in 'password', with: 'passwordz'
    click_button 'Sign In'
    expect(page).to have_content("Invalid details")
  end

end
