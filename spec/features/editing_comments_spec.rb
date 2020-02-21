# frozen_string_literal: true

feature 'user can update comments' do
  scenario 'from the timeline' do
    sign_up
    click_link 'Home'
    create_post
    create_comment
    click_link 'Edit comment'
    edit_comment
    expect(page).not_to have_content('test comment')
    expect(page).to have_content('Test comment 1')
    expect(page).to have_content('Your comment has been successfully edited.')
  end

  scenario 'from the user page' do
    sign_up
    create_post
    create_comment
    click_link 'Edit comment'
    edit_comment
    expect(page).not_to have_content('test comment')
    expect(page).to have_content('Test comment 1')
    expect(page).to have_content('Your comment has been successfully edited.')
  end

  scenario 'it throws an error when not your comment to update' do
    sign_up
    click_link 'Home'
    create_post
    create_comment
    click_link 'Sign Out'
    sign_up_two
    click_link 'Home'
    click_link 'Edit comment'
    edit_comment
    expect(page).to have_content('Apologies, this is not your comment to update!')
    expect(page).not_to have_content('Test comment 1')
  end
end
