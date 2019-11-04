require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can edit own posts' do
    signing_up
    create_post
    visit '/posts'
    click_link 'Edit'
    fill_in "Message", with: "Hello Robbie"
    click_button 'Edit post'
    expect(page).to have_content('Hello Robbie')
  end
end
 
