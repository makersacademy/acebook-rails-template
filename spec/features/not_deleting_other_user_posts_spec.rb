# frozen_string_literal: true

feature 'A user cannot delete another users post' do
  scenario 'from the wall - it gives the user a prompt' do
    sign_up
    click_link 'Home'
    create_post
    click_link 'Sign Out'
    sign_up_two
    visit '/posts'
    click_link 'Delete'
    expect(page).to have_content 'Apologies, this is not your post to delete!'
    expect(page).to have_content 'test message'
  end

  scenario 'from the user homepage - it gives the user a prompt' do
    sign_up
    create_post
    click_link 'Home'
    create_post
    click_link 'Sign Out'
    sign_up_two
    visit '/posts'
    click_link 'uvalente'
    click_link 'Delete'
    expect(page).to have_content 'Apologies, this is not your post to delete!'
    expect(page).to have_content 'test message'
  end
end
