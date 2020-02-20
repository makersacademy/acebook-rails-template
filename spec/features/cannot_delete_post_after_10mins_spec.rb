RSpec.feature 'Users can delete a post once created', type: :feature do
  scenario 'User creates a second post' do
    visit('/')
    click_on('Signup')
    fill_in('user[username]', with: 'user1')
    fill_in('user[email]', with: 'test@example.com')
    fill_in('user[password]', with: 'password')
    click_on('Join the Rebel Alliance')
    click_on 'New Post'
    fill_in 'post[post_content]', with: 'Hey there'
    click_on 'Create Post'
    expect(page).to have_content('Hey there')
    x = Time.zone.now + 660
    travel_to(x)
    click_on 'Delete'
    expect(page).to have_content('Hey there')
  end
end
