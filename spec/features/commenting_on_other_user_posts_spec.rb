# frozen_string_literal: true

feature 'user can comment on other peoples posts' do
  scenario 'from the timeline' do
    sign_up
    create_post
    click_link 'Home'
    create_post
    click_link 'Sign Out'
    sign_up_two
    click_link 'Home'
    fill_in 'comment[body]', with: 'Jack the Mac'
    click_button 'Add Comment'
    within('div.comment-container') do
      expect(page).to have_content('Jack the Mac')
      expect(page).to have_content('asia')
    end
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
    within('div.comment-container') do
      expect(page).to have_content('Jack the Mac')
      expect(page).to have_content('asia')
    end
  end
end
