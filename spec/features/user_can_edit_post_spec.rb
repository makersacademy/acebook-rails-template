require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can edit own posts if posted less than 10 mins ago' do
    signing_up
    create_post
    visit '/posts'
    click_link 'Edit'
    fill_in "Message", with: "Hello John"
    click_button 'Edit post'
    expect(page).to have_content('Hello John')
  end
end

RSpec.feature 'Timeline', type: :feature do
  scenario 'Cannot edit own posts if posted more than 10 mins ago' do
    signing_up
    create_post
    post = Post.find_by(message: 'Hello Robbie')
    post.created_at -= 11.minutes
    visit '/posts'
    expect(page).to_not have_button('Edit')
  #  binding.pry
  end
end
