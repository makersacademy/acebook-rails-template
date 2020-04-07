require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Posts can render line breaks' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: "Hello,\n world!"
    click_button 'Submit'
    expect(page).to have_content("Hello, world")
  end
end
