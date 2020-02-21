# frozen_string_literal: true

feature 'users can create a friendship' do
  scenario 'from the users page' do
    sign_up
    click_link 'Home'
    create_post
    click_link 'Sign Out'
    sign_up_two
    click_link 'Home'
    click_link 'uvalente'
    click_button 'Add friend'
    expect(page).to have_content('Friend Added')
  end

  scenario 'user try to be friend with himself' do
    sign_up
    click_button 'Add friend'
    expect(page).to have_content("You can't befriend yourself")
  end

  scenario 'user try to be friend twice' do
    sign_up
    click_link 'Home'
    create_post
    click_link 'Sign Out'
    sign_up_two
    click_link 'Home'
    click_link 'uvalente'
    click_button 'Add friend'
    click_button 'Add friend'
    expect(page).to have_content('You are already friend')
  end

  scenario 'user try to be friend twice from different user' do
    sign_up
    click_link 'Home'
    create_post
    click_link 'Sign Out'
    sign_up_two
    click_link 'Home'
    create_post
    click_link 'Home'
    click_link 'uvalente'
    click_button 'Add friend'
    click_link 'Sign Out'
    click_link 'Sign In'
    fill_in 'session[email]', with: 'umberto@acebook.com'
    fill_in 'session[password]', with: 'password'
    click_button 'Sign in'
    click_link 'Home'
    click_link 'asia'
    click_button 'Add friend'
    expect(page).to have_content('You are already friend')
  end
end
