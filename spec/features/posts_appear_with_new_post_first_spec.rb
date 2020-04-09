require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Posts appear in chronological order' do
    sign_up
    log_in
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'New post'
    fill_in 'Message', with: "Hello again world"
    click_button 'Submit'
    expect(page).to have_content("Hello again world")
    expect(first('p')).to have_content("Hello again world")
  end
end
