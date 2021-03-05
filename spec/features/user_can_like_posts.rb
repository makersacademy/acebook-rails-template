require 'rails_helper'

RSpec.feature 'Liking posts', type: :feature do
  scenario 'A user can like a post' do 
    register 
    submit_post
    click_button 'Like'
    expect(page).to have_content '1 Like'
  end 

  scenario 'A user can unlike a post' do
    register 
    submit_post
    click_button 'Like'
    click_button 'Unlike'
    expect(page).not_to have_content '2 Likes'
    expect(page).to have_content '0 Likes'
  end 

  scenario "A non signed in user can't like a post" do 
    register
    submit_post
    click_link 'Sign out'
    expect(page).not_to have_button 'Like'
  end  

end 