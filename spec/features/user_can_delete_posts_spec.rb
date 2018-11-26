RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and delete them' do
    user = create(:user)
    login_as(user, scope: :user)
    visit '/posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'This is a test post!'
    click_button 'Create Post'
    visit '/posts'
    click_link 'Destroy'
    expect(page).not_to have_content('This is a test post!')
  end
  scenario 'Cannot delete others posts' do
    user = create(:user)
    login_as(user, scope: :user)
    visit '/posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'This is a test post!'
    click_button 'Create Post'
    second_user = create(:user, email: 'joel@test.com', name: 'Joel', password: 'password123')
    login_as(second_user, scope: :user)
    visit '/posts'
    click_link 'This is a test post!'
    expect(page).not_to have_content('Destroy')
  end
end
