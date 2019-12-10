require 'rails_helper'
require 'web_helpers'  

RSpec.feature "Edit/update posts", type: :feature do
  
  scenario "update link vanishes after 10 mins" do
    sign_up_and_go_to_new_post
    post_creation_time = Time.now - 650
    Timecop.freeze(post_creation_time)
      fill_in "Message", with: "Hello, world!"
      click_button "Submit"
    Timecop.return # "turn off" Timecop
    page.refresh
    expect(page).to_not have_link("Update")
  end

  scenario "redirected to posts page if you try to access edit url after 10 mins" do
    sign_up_and_go_to_new_post
    post_creation_time = Time.now - 650
    Timecop.freeze(post_creation_time)
      fill_in "Message", with: "Hello, world!"
      click_button "Submit"
    Timecop.return # "turn off" Timecop
    url_id = Post.find_by(message: "Hello, world!").id
    visit "/posts/#{url_id}/edit"
    expect(current_url).to eq("http://www.example.com/posts")
  end

  scenario "Can submit posts and view them" do
    sign_up_and_go_to_new_post
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    post = Post.find_by(message: "Hello, world!" )
    find("#post_#{post.id}").click_link "Update"
    fill_in "Message", with: "Hi, there!"
    click_button "Submit"
    expect(page).not_to have_content("Hello, world!")
    expect(page).to have_css('.header', text: "Your post has been updated")
    expect(page).to have_css('.post', text: "Hi, there!")
  end

  scenario "cannot edit other people's posts" do
    sign_up_and_go_to_new_post
    fill_in "Message", with: "Hello, this is my first post"
    click_button "Submit"
    click_on "navdropdown"
    click_on "Sign out"
    sign_up_second_user
    post = Post.find_by(message: "Hello, this is my first post" )
    find("#post_#{post.id}").click_link "Update"
    expect(page).to have_css('.header', text: "You cannot update other people's posts")
    expect(page).to have_css('.post', text: "Hello, this is my first post")
  end

end
