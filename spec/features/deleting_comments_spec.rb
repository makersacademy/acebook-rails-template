# frozen_string_literal: true

feature 'user can delete comments' do
  scenario 'from the timeline' do
    sign_up
    create_post
    click_link 'Home'
    create_comment
    click_link 'Delete comment'
    expect(page).not_to have_content('test comment')
  end

  scenario 'from the user homepage' do
    sign_up
    create_post
    create_comment
    click_link 'Delete comment'
    expect(page).not_to have_content('test comment')
  end

  scenario 'it throws an error when not your comment to delete' do
    sign_up
    create_post
    create_comment
    click_link 'Sign Out'
    sign_up_two
    click_link 'Home'
    click_link 'Delete comment'
    expect(page).to have_content('Apologies, this is not your comment to delete!')
  end
end
