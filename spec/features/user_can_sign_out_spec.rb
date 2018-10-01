RSpec.feature 'Sign out', type: :feature do
  scenario 'User can sign out of website' do
    visit '/customers/sign_up'
    fill_in 'customer_email', with: 'test@test.com'
    fill_in 'customer_password', with: 'test123'
    fill_in 'customer_password_confirmation', with: 'test123'
    click_button 'Sign up'
    # put above 5 lines into web helper
    click_link 'get :sign_out'
    expect(page).to have_content 'Signed out successfully'
    # second expectation to check user is no longer in session
  end
end
