feature 'users can visit sign up page' do
  scenario 'and enter emails and passwords' do
    visit '/users/sign_up'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'testpass'
    fill_in 'Password confirmation', with: 'testpass'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end


  scenario 'and enter emails incorrectly ' do
    Capybara.current_driver = :selenium
    visit '/users/sign_up'
    fill_in 'Email', with: 'test'
    fill_in 'Password', with: 'testpass'
    fill_in 'Password confirmation', with: 'testpass'
    click_button 'Sign up'
    expect(page).to have_current_path("/users/sign_up")
  end

  Capybara.use_default_driver
end
