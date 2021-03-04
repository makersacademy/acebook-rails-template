feature 'sign up page' do
  scenario 'user can enter email and password to sign up' do
    sign_up(email: 'test@email.com', username: 'Troy', password: 'testpass')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'cannot sign up with invalid email' do
    Capybara.current_driver = :selenium_chrome_headless
    sign_up(email: 'test', username: 'Troy', password: 'testpass')
    expect(page).to have_current_path("/users/sign_up")
  end

  Capybara.use_default_driver

  context 'when password is too short' do
    scenario 'user cannot sign up and is warned' do
      sign_up(email: 'test@email.com', username: 'Troy', password: 'short')
      expect(page).to have_content('Password is too short')
    end
  end

  context 'when password is too long' do
    scenario 'user cannot sign up and is warned' do
      sign_up(email: 'test@email.com', username: 'Troy', password: 'long password')
      expect(page).to have_content('Password is too long')
    end
  end

  context 'when users correctly submit details' do
    scenario 'user is redirected to the home page' do
      visit('/')
      click_link('Sign out')
      sign_up(email: 'test@email.com', username: 'Troy', password: 'testpass')
      expect(page).to have_current_path('/')
    end
  end

end
