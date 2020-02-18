RSpec.feature 'Users can delete a post once created', type: :feature do
  scenario 'User deletes their own post' do
    visit '/'
    click_on 'Signup'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Signup'
    click_on 'New Post'
    fill_in 'post[post_content]', with: 'Hey there'
    click_on 'Create Post'
    expect(page).to have_content('Hey there')
    click_on 'Delete'
    expect(page).not_to have_content('Hey there')
  end

  scenario 'User is not allowed to delete someone elses post' do
    visit '/'
    click_on 'Signup'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Signup'
    click_on 'New Post'
    fill_in 'post[post_content]', with: 'Hey there'
    click_on 'Create Post'
    click_on 'Logout'
    click_on 'Signup'
    fill_in 'user[email]', with: 'test2@test.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Signup'
    click_on 'Delete'
    expect(page).to have_content('Not authorized to delete this post')
  end
end
