require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can update post after creating it' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Edit'
    fill_in 'Message', with: 'Bye, world!'
    click_button 'Submit'
    expect(page).to have_content('Bye, world!')
    expect(page).to have_content(Time.now().strftime("%I:%M %p"))
  end
end
