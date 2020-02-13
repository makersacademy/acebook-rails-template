# frozen_string_literal: true

feature 'redirects the user to the homepage if not logged in' do
  scenario 'redirects a non logged in user' do
    visit('/posts')
    expect(page).to have_current_path('/welcome/index')
  end
end
