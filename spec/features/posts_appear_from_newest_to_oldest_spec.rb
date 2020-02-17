require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'Posts are shown from newest to oldest' do
    sign_up

    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Meow one'
    click_button 'Submit'
    click_link 'New post'
    fill_in 'Message', with: 'Meow two'
    click_button 'Submit'
    expect(page).to have_content("
    cats@cats.com 
    #{Time.now.strftime('%m/%d/%Y, %H:%M')}
    Edit Delete
    Meow two
     
    cats@cats.com 
    #{Time.now.strftime('%m/%d/%Y, %H:%M')} 
    Edit Delete
    Meow one")
  end
end