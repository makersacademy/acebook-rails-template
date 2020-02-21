RSpec.feature 'Users can create multiple posts', type: :feature do
  scenario 'User creates a second post' do
    visit('/')
    click_on('Signup')
    fill_in('user[username]', with: 'user1')
    fill_in('user[email]', with: 'test@test.com')
    fill_in('user[password]', with: 'password')
    page.select('Kashyyyk', from: 'user[planet]')
    click_on('Join the Rebel Alliance')
    click_on 'New Post'
    fill_in 'post[post_content]', with: 'Hey there'
    click_on 'Create Post'
    click_on 'New Post'
    fill_in 'post[post_content]', with: 'Hey again'
    click_on 'Create Post'
    post_time = Post.all[1].created_at
    expect(page).to have_content('Hey there')
    expect(page).to have_content('Hey again')
    expect(page).to have_content(post_time.to_s(:rfc822)[17..21])
    expect(page).to have_content('Hey again')
  end
end
