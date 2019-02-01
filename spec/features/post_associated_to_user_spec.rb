require 'rails_helper'
RSpec.feature 'Post Association', type: :feature do 
  scenario 'User can only see their posts on their profile' do 
    signup_and_click
    click_on 'New Post'
    fill_in 'Message', with: 'Message1'
    click_button 'Submit'
    click_on 'New Post'
    fill_in 'Message', with: 'Message2'
    click_button 'Submit'
    # visit '/signin'
    # second_user_signup_and_click
    # click_on 'New Post'
    # fill_in 'Message', with: 'SecondUserMessage'
    # click_button 'Submit'
    # visit '/signup'
    expect(page.current_path).to eql('/users/1')
    expect(page).to have_content('Message1')
    expect(page).to have_content('Message2')
    expect(page).to have_content(Time.now.strftime('%H:%M:%S - %d/%m/%y'))
  end
end 
