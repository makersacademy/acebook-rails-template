feature 'log out' do
  scenario 'a signed in user can log out' do
    sign_up
    expect(page).not_to have_content('Sign In')
    click_link 'logout'
    visit('/posts')
    expect(page).to have_current_path('/')
  end
end 