RSpec.feature 'User can click on a username and be directed to user wall', type: :feature do
  scenario 'User clicks on a username' do
    visit '/'
    click_on 'Signup'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Join the Rebel Alliance'
    click_on 'New Post'
    fill_in 'post[post_content]', with: 'Post on my wall'
    click_on 'Create Post'
    click_on 'wookiebook'
    click_on 'New Post'
    fill_in 'post[post_content]', with: 'Post on main wall'
    click_on 'Create Post'
    click_on 'Logout'
    click_on 'Signup'
    fill_in 'user[email]', with: 'test2@test.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Join the Rebel Alliance'
    click_on 'wookiebook'
    click_on 'test@test.com'
    expect(page).to have_content('Post on my wall')
  end
end
