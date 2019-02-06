require 'rails_helper'

feature 'User can delete posts' do
  scenario 'User can delete his own post on his own wall' do
    signup_and_click
    click_on 'New Post'
    fill_in 'Message', with: 'Message1'
    click_button 'Submit'
    click_link 'Message1'
    click_on 'Delete'
    expect(page.current_path).to eq '/users/1'
    expect(page).not_to have_content "Message1"
   
  end
end
