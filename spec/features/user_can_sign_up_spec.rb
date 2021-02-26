RSpec.feature 'Registration', type: :feature do
  scenario 'Users can sign up on the sign up page' do
    sign_in
    expect(page).to have_content('Welcome, Joe!')
  end

  scenario "Users can't sign up if email is already in database" do 
    sign_in
    click_button 'Logout'
    sign_in
    expect(page).to have_content("Email joebloggs@test.com already exists. Please enter a new email address")
  end
end
