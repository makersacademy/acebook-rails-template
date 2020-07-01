require 'rails_helper'

feature 'Delete post' do
  scenario 'user can delete a post' do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Delete me!"
    click_button "Submit"
    click_link 'Delete'
    expect(page).to_not have_content("Delete me!")
  end
end

feature 'Update post' do
  scenario 'user can Update a post' do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Update me!"
    click_button "Submit"
    click_link 'Edit'
    fill_in "Message", with: "I'm changed I promise!!!"
    click_button "Submit"
    expect(page).to have_content("I'm changed I promise!!!")
    expect(page).to_not have_content('Update me!')
  end
end

feature 'Update post after 10 mins' do
  
  before do
    travel_to Time.zone.local(2004)
  end

  after do
    travel_back
  end

  scenario 'User cant update a post after 10 mins' do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Update me!"
    click_button "Submit"
    expect(page).to_not have_link("Edit")
  end
end
