require 'rails_helper'


RSpec.feature 'Timeline', type: :feature do
  scenario 'Can update posts and view them' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    within("//div[@id='1' and @class='posts']") do
      click_link 'Update post'
    end
    fill_in 'Message', with: 'Goodbye, world!'
    click_button 'Submit'
    expect(page).to have_content('Goodbye, world!')
  end
end