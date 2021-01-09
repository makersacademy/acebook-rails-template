describe 'adding posts to a wall' do
  it 'posting to a persons wall and viewing it' do
    user1 = User.create(email: 'testenv@example.com', password: 'testpass')
    user2 = User.create(email: 'testenv2@example.com', password: 'testpass2')
    visit '/users/sign_in'
    fill_in 'Email', with: 'testenv@example.com'
    fill_in 'Password', with: 'testpass'
    click_button 'Log in'
    expect(page).to have_current_path("/#{user1.id}", ignore_query: true)
    visit("/#{user2.id}")
    fill_in 'post[message]', with: 'hello world'
    click_button('Post')
    expect(page).to have_current_path("/#{user2.id}", ignore_query: true)
    expect(page).to have_content('testenv2@example.com')
    expect(page).to have_content('hello world by testenv@example.com')
    expect(page).to have_current_path("/#{user2.id}", ignore_query: true)
  end
end
