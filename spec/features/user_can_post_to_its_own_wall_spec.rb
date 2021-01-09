describe 'Posting to own wall' do
  it 'user can post to own wall' do
    user = User.create(email: 'testenv@example.com', password: 'testpass')
    visit '/users/sign_in'
    fill_in 'Email', with: 'testenv@example.com'
    fill_in 'Password', with: 'testpass'
    click_button 'Log in'
    expect(page).to have_current_path("/#{user.id}", ignore_query: true)
    fill_in 'post[message]', with: 'my wall'
    click_button('Post')
    expect(page).to have_content('testenv@example.com')
  end
end
