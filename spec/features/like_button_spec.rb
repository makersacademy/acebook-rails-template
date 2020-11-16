require 'rails_helper'

RSpec.feature "Like", type: :feature do

  scenario"Guest user visit the page and can't find the like button" do 
    visit('/')
    expect(page).not_to have_selector(:link_or_button, 'Like')
  end

  scenario"User visit the page and click like button" do 
    visit('/')
    signup_and_login
    add_post("text")
    click_link 'Like'
    expect(page).to have_content("1 Like")
    expect(page).not_to have_selector(:link_or_button, 'Like')
  end

  scenario"User visit the page and click like button" do 
    visit('/')
    signup_and_login
    add_post("text")
    click_link "Like"
    click_link "Unlike"
    expect(page).to have_content("0 Likes")
    expect(page).not_to have_selector(:link_or_button, 'Unlike')
  end

  scenario"User visit the page and click like button" do 
    visit('/')
    signup_and_login
    add_post("text")
    click_link "Like"
    click_link "Log Out"
    signup_and_login_2
    click_link "Like"
    expect(page).to have_content("2 Likes")
    expect(page).not_to have_selector(:link_or_button, 'Like')
  end


end