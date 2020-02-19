# frozen_string_literal: true

describe 'log out' do
  it 'a signed in user can log out' do
    sign_up
    expect(page).not_to have_content('Sign In')
    click_link 'logout'
    visit('/posts')
    expect(page).to have_current_path('/')
  end

  it 'a signed out user can not log out' do
    visit('/')
    expect(page).not_to have_content('logout')
  end
end
