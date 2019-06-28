require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  before(:each) do
    sign_up_user
    sign_in_user
  end

  scenario "Can submit posts and view them" do
    visit "/posts"
    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can post on another user's wall" do
    click_button 'Feed'
    new_post
    sign_up_another_user
    sign_in_another_user
    click_button 'Feed'
    click_link('Lisa')
    fill_in 'post_message', with: 'Sugarcubes megafan alert!'
    click_button "Submit"
    expect(page).to have_content("Sugarcubes megafan alert!")
  end

  scenario "Posts are ordered - newest at the top" do
    visit "/posts"

    fill_in "post_message", with: "First, hello!"
    click_button "Submit"

    fill_in "post_message", with: "Second, hello!"
    click_button "Submit"

    expect(first('.box')).to have_content("Second, hello!")
  end

  scenario "Posts have timestamps" do
    visit "/posts"

    fill_in "post_message", with: "First, hello!"
    click_button "Submit"
    time = Post.all[0].created_at.strftime("%Y-%m-%d %H:%M")

    expect(first('.box')).to have_content(time)
  end

  scenario 'Users can delete posts' do
    visit '/posts'
    fill_in 'post_message', with: 'First line hello!'
    click_button 'Submit'

    expect(first('.box')).to have_content('First line hello!')
    click_link('Delete')
    expect(page).not_to have_content('First line hello!')
  end

  scenario 'Users can edit posts' do
    visit '/posts'
    fill_in 'post_message', with: 'First line hello!'
    click_button 'Submit'

    expect(first('.box')).to have_content('First line hello!')
    click_link('Edit')
    post_id = Post.all[0].id
    expect(current_path).to eq("/posts/#{post_id}/edit")
  end

  scenario 'Post displays the name of the user who made it' do
    fill_in 'post_message', with: 'First line hello!'
    click_button 'Submit'
    expect(first('.box')).to have_content('Lisa')
  end
end
