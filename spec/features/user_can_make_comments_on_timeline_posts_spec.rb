RSpec.feature 'Timeline post comments', type: :feature do
  scenario 'User submits a comment' do
    sign_up
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    visit '/posts'
    fill_in 'message', with: 'Comment, world!'
    click_button 'Submit'
    expect(page).to have_content('Comment, world!')
  end

  scenario 'User cannot submit empty comment' do
    sign_up
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    visit '/posts'
    fill_in 'message', with: ''
    click_button 'Submit'
    expect(page).to have_content("Your new post couldn't be created!")
  end
end
