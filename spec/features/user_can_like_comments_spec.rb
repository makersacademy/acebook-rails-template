require 'rails_helper'

RSpec.feature "Like a comment", type: :feature do
  scenario "user creates post, adds comment to post and likes their comment" do 
    sign_up
    expect(page).to have_content("You have no posts... :(")
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "On my momma I be breathing"
    click_button "Submit"
    expect(current_path).to eq('/posts')
    click_link "Post Details"
    fill_in "Comment", with: "Damn homie"
    click_button "Submit"
    expect(page).to have_content("\n0\n😸")
    page.find_by_id('like').click
    expect(page).to have_content("😸")
    page.refresh
    expect(page).to have_content("\n1\n😸")
  end
  scenario "user creates post, adds comment to post, likes their comment, then unlikes" do 
    sign_up
    expect(page).to have_content("You have no posts... :(")
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "On my momma I be breathing"
    click_button "Submit"
    expect(current_path).to eq('/posts')
    click_link "Post Details"
    fill_in "Comment", with: "Damn homie"
    click_button "Submit"
    expect(page).to have_content("\n0\n😸")
    page.find_by_id('like').click
    expect(page).to have_content("😸")
    page.refresh
    expect(page).to have_content("\n1\n😸")
    page.find_by_id('liked').click
    expect(page).to have_content("😸")
    page.refresh
    expect(page).to have_content("\n0\n😸")
  end
end
