# frozen_string_literal: true

feature 'user can delete posts' do
  scenario 'from the timeline' do
    sign_up
    create_post
    visit '/posts'
    click_link 'Delete'
    expect(page).not_to have_content('test message')
  end
end
