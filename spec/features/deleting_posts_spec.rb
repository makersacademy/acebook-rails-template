# frozen_string_literal: true

feature 'user can delete posts' do
  scenario 'from the timeline' do
    sign_up
    visit '/posts'
    create_post
    click_link 'Delete'
    expect(page).not_to have_content('test message')
  end

  scenario 'from the timeline, comments will also be destroyed' do
    sign_up
    create_post
    create_comment
    click_link 'Delete'
    expect(page).not_to have_content('test message')
    expect(page).not_to have_content('test comment')
  end
end
