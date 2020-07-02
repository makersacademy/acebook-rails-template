require 'rails_helper'
require_relative '../support/features/post_helpers.rb'

RSpec.feature "Timeline", type: :feature do

  scenario "Can submit posts and view date" do
    creates_a_post
    expect(page).to have_content("#{Time.now.strftime("%Y-%m-%d")}", "#{Time.now.strftime("%k:%M")}")
  end

  scenario "User email for creator" do
    creates_a_post
    expect(page).to have_content("bob1 Hello, world!")
  end

  scenario "Order of posts based on time created" do
    creates_a_post
    creates_a_post2
    expect(page).to have_content(/Hello, again.*Hello, world!/)
  end

  xscenario "A post can be added with line breaks" do
    sign_in 
    click_link "New post"
    fill_in "Message", with:
    "I am a post." + "\r\n" + "One which has new lines"
    click_button "Submit"
    expect(find('#body').text).to eq("I am a post.\nOne which has new lines")
  end
end
