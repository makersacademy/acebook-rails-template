require 'rails_helper'

RSpec.feature 'delete or edit own posts' do 
  
  scenario 'user cant delete other peoples posts ' do
    signup_and_click
    logout
    second_user_signup_and_click
    visit '/users/1'
    click_on 'New Post'
    fill_in 'Message', with: 'Message1'
    click_on 'Submit'
    logout
    login
    click_link "Message1"
    click_on "Delete"
    expect(page).to have_content "NOT YOUR POST"

  end 

  scenario 'user cant edit other people posts' do
    signup_and_click
    logout
    second_user_signup_and_click
    visit '/users/1'
    click_on 'New Post'
    fill_in 'Message', with: 'Message1'
    click_on 'Submit'
    logout
    login
    click_link "Message1"
    click_on "Edit"
    expect(page).to have_content "NOT YOUR POST"
  end
end