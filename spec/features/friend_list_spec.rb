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
    find('#dropdown03')
    click_link 'Your Friends'
    expect(page).to have_content('uvalente - friend from:')
  end
end
