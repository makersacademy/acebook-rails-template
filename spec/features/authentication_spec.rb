feature 'Authentication' do
  scenario 'a logged out user tries to visit the posts page' do
    visit '/posts'
    expect(page).to have_content "You must be logged in to access this section"

  end
end
