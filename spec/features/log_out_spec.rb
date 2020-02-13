feature 'log out' do
  scenario 'a signed in user can log out' do
    sign_up
    expect(page).not_to have_content('Sign In')
    click_link 'Sign Out'
    visit('/posts')
    expect(page).to have_current_path('/welcome/index')
  end

  scenario 'a signed out user can not log out' do
    visit('/')
    expect(page).not_to have_content('Sign Out')
  end
end