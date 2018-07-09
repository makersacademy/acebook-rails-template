require 'rails_helper'

RSpec.feature "User can like a post", type: :feature do
  scenario 'successfully' do
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: 'millie@gmail.com'
    fill_in "Firstname", with: "Millie"
    fill_in "Lastname", with: "Smith"
    fill_in "Password", with: "Secure123"
    fill_in "Password confirmation", with: "Secure123"
    click_button 'Sign up'
    fill_in "What's on your mind?", with: "test text"
    click_button 'Post'
    click_button 'Like'
    expect(page).to have_content("Likes:1")
  end
end

RSpec.feature "User cannot like post twice", type: :feature do
  scenario 'successfully' do
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: 'millie@gmail.com'
    fill_in "Firstname", with: "Millie"
    fill_in "Lastname", with: "Smith"
    fill_in "Password", with: "Secure123"
    fill_in "Password confirmation", with: "Secure123"
    click_button 'Sign up'
    fill_in "What's on your mind?", with: "test text"
    click_button 'Post'
    click_button 'Like'
    click_button 'Like'
    expect(page).not_to have_content("Likes:2")
  end
end
