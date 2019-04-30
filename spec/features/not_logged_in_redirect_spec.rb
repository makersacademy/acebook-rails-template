feature 'Redirects to index if user not logged in' do
  scenario 'User is redirected to index if they try to view posts and are not logged in' do
    visit '/posts'
    expect(page).to have_content 'Welcome to AceBook'
  end
  scenario 'User is not redirected to index if they try to view posts and are logged in' do
    sign_up_helper('user@test.com', '123456')
    log_in_helper('user@test.com', '123456')
    visit '/posts'
    expect(page).to have_content 'New post'
  end
end
