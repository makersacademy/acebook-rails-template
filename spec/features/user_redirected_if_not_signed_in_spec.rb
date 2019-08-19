feature 'Redirect if not signed in' do
  scenario 'If the user is not signed and go to the posts page'\
            'they get redirected to log in page' do
    visit ('/posts')
    expect(page).to have_content("Please log in")
  end
end
