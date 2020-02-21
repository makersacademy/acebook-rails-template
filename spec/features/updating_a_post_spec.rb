# frozen_string_literal: true

feature 'User can update a post' do
  scenario 'user updates a post on the wall' do
    sign_up
    click_link 'Home'
    create_post
    click_link 'Edit'
    fill_in 'post[message]', with: 'updated message'
    click_button 'Update'
    expect(page).to have_content('updated message')
  end

  scenario 'user receives an error if trying to update another users post' do
    sign_up
    click_link 'Home'
    create_post
    click_link 'Sign Out'
    sign_up_two
    click_link 'Home'
    click_link 'Edit'
    fill_in 'post[message]', with: 'updated message'
    click_button 'Update'
    expect(page).to have_content('Apologies, this is not your post to update!')
    expect(page).not_to have_content('updated message')
  end
end
