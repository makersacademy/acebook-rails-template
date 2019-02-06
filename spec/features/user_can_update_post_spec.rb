RSpec.feature 'Edit Post', type: :feature do
  scenario 'User can edit a post' do
    sign_up
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world'
    click_button 'Submit'
    click_link 'Hello, world'
    fill_in 'Message', with: 'Goodbye, world!'
    click_button 'Edit'
    expect(page).to have_content('Goodbye, world!')
    expect(page).not_to have_content('Hello, world')
  end

  scenario 'User cannot change post to be blank' do
    sign_up
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Hello, world!'
    fill_in 'Message', with: ''
    click_button 'Edit'
    expect(page).to have_content('Message')
  end

  scenario 'User cannot edit other user posts' do
    sign_up
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Sign Out'
    second_user_sign_up
    visit '/users/davethecat@katze.com'
    expect(page).not_to have_link("Hello, world!")
    expect(page).to have_content "Hello, world!"
  end
end
