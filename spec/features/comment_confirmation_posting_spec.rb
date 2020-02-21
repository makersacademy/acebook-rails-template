# frozen_string_literal: true

feature 'user can comment on other peoples posts and receive confirmation' do
  scenario 'from the timeline' do
    sign_up
    click_link 'Home'
    create_post
    click_link 'Sign Out'
    sign_up_two
    click_link 'Home'
    fill_in 'comment[body]', with: 'Jack the Mac'
    click_button 'Add Comment'
    expect(page).to have_content('Your comment has been successfully added.')
  end

  scenario 'from a user homepage' do
    sign_up
    create_post
    click_link 'Home'
    create_post
    click_link 'Sign Out'
    sign_up_two
    click_link 'Home'
    click_link 'uvalente'
    fill_in 'comment[body]', with: 'Jack the Mac'
    click_button 'Add Comment'
    expect(page).to have_content('Your comment has been successfully added.')
  end
end
