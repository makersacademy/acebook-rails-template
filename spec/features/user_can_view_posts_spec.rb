require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can view posts reverse chronological order" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "First Post"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Second Post"
    click_button "Submit"
    index_of_first_post = page.body.index('First Post')
    index_of_second_post = page.body.index('Second Post')
    expect(index_of_second_post).to be < index_of_first_post
  end

  scenario "Can see date of posts " do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Blah Blah"
    click_button "Submit"
    current_date = Time.now.strftime("%d/%m/%Y")
    expect(page).to have_content "#{current_date}"
  end
end
