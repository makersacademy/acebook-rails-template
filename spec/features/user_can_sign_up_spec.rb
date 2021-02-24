RSpec.feature 'Registration', type: :feature do
  scenario 'Users can sign up on the sign up page' do
    visit '/sign_up'
    fill_in 'first_name', with: 'Joe'
    fill_in 'last_name', with: 'Bloggs'
    fill_in 'email', with: 'joebloggs@test.com'
    fill_in 'password', with: 'bad_password_123'
    fill_in 'password_confirmation', with: 'bad_password_123'
    click_button 'Sign up'
    expect(page).to have_content('Welcome, Joe!')
  end
end