feature 'sign up page' do
  scenario 'user can enter email and password to sign up' do
    visit '/users/sign_up'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'testpass'
    fill_in 'Password confirmation', with: 'testpass'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end


  scenario 'cannot sign up with invalid email' do
    Capybara.current_driver = :selenium
    visit '/users/sign_up'
    fill_in 'Email', with: 'test'
    fill_in 'Password', with: 'testpass'
    fill_in 'Password confirmation', with: 'testpass'
    click_button 'Sign up'
    expect(page).to have_current_path("/users/sign_up")
  end

  Capybara.use_default_driver

  context 'when password is too short' do
    scenario 'user cannot sign up and is warned' do
      visit '/users/sign_up'
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: 'short'
      fill_in 'Password confirmation', with: 'short'
      click_button 'Sign up'
      expect(page).to have_content('Password is too short')
    end
  end

  context 'when password is too long' do
    scenario 'user cannot sign up and is warned' do
      visit '/users/sign_up'
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: 'longpassword'
      fill_in 'Password confirmation', with: 'longpassword'
      click_button 'Sign up'
      expect(page).to have_content('Password is too long')
    end
  end

  context 'when users correctly submit details' do
    scenario 'user is redirected to their posts page' do
      visit '/users/sign_up'
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: 'testpass'
      fill_in 'Password confirmation', with: 'testpass'
      click_button 'Sign up'
      expect(page).to have_current_path('/')
    end
  end

end
