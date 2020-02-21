# frozen_string_literal: true

feature 'user can comment on post' do
  scenario 'from the timeline' do
    sign_up
    click_link 'Home'
    create_post
    fill_in 'comment[body]', with: 'Hello'
    click_button 'Add Comment'
    within('div.comment-container') do
      expect(page).to have_content('Hello')
      expect(page).to have_content('uvalente')
    end
  end

  scenario 'from a user homepage' do
    sign_up
    create_post
    fill_in 'comment[body]', with: 'Jack the Mac'
    click_button 'Add Comment'
    within('div.comment-container') do
      expect(page).to have_content('Jack the Mac')
      expect(page).to have_content('uvalente')
    end
  end
end
