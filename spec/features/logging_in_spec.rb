
RSpec.feature 'Signing in', type: :feature do
  scenario 'Can sign in' do
    signup
    visit('/logout')
    visit('/login')
    fill_in('Email', with: 'not an email')
    fill_in('Password', with: 'not a password')
    click_button('Log in')
    visit('/login')
    fill_in('Email', with: 'user@email.com')
    fill_in('Password', with: 'password')
    click_button('Log in')
    expect(page).to have_content('Welcome to Acebook, Alfie!')
  end

  scenario 'Cannot sign in with invalid email/password' do
    visit('/login')
    fill_in('Email', with: 'not an email')
    fill_in('Password', with: 'not a password')
    click_button('Log in')
    expect(page).to have_content('Invalid email/password combination!')
  end
end
