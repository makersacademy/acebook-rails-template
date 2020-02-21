# frozen_string_literal: true

feature 'post on other user wall' do
  scenario 'a user can post on another user wall' do
    sign_up
    click_link 'Home'
    create_post
    click_link 'Sign Out'
    sign_up_two
    click_link 'Home'
    click_link 'uvalente'
    fill_in 'post[message]', with: 'Hello Umberto'
    click_button 'Add post'
    expect(page).to have_content 'Hello Umberto'
    click_link 'Home'
    expect(page).not_to have_content 'Hello Umberto'
  end
end
