require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'On Posts Index, posts are shown from newest to oldest' do
    sign_up
    visit '/posts'
    click_link 'New post'
    fill_in "area", with: 'Meow one'
    click_button 'Submit'
    click_link 'New post'
    fill_in "area", with: 'Meow two'
    click_button 'Submit'
    expect(page).to have_content("
    cats@cats.com 
    #{Time.now.strftime('%m/%d/%Y, %H:%M')}
    Edit Delete 
    Meow two 
    ♡ 0 Likes Add Comment
     
    cats@cats.com 
    #{Time.now.strftime('%m/%d/%Y, %H:%M')} 
    Edit Delete 
    Meow one 
    ♡ 0 Likes Add Comment")
  end

  scenario 'On User Walls, posts are shown from newest to oldest' do
    sign_up
    new_post_on_own_wall("Hello, meOW")
    new_post_on_own_wall("I'm up here!")
    visit user_page_path(User.all.first.id)
    expect(page).to have_content("
    cats@cats.com 
    #{Time.now.strftime('%m/%d/%Y, %H:%M')}
    Edit Delete
    I'm up here!
     
    cats@cats.com 
    #{Time.now.strftime('%m/%d/%Y, %H:%M')} 
    Edit Delete
    Hello, meOW")
  end
end
