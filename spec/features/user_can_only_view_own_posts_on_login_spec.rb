RSpec.feature 'Posts to a wall are only visible on that particular wall', type: :feature do
  scenario 'Posts to a wall are only visible on that particular wall' do
    visit('/')
    click_on('Signup')
    fill_in('user[email]', with: 'test@test.com')
    fill_in('user[password]', with: 'password')
    click_on('Join the Rebel Alliance')
    click_on 'New Post'
    fill_in 'post[post_content]', with: 'Hey there'
    click_on 'Create Post'
    expect(page).to have_content('Hey there')
    expect(page).to have_content('test@test.com')
    click_on 'wookiebook'
    expect(page).not_to have_content('Hey there')
    expect(page).not_to have_content('test@test.com')
  end
end
