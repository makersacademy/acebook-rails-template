require 'rails_helper'

RSpec.feature "Liking posts", type: :feature do
  scenario "User can like posts" do
    sign_up
    expect(page).to have_content("You have no posts... :(")
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "On my momma I be breathing"
    click_button "Submit"
    expect(current_path).to eq('/posts')
    # expect(page).to have_link('&#128568')
    this = page.find_by_id('like')
    this.click
    expect(page).to have_content("\n1\n😸")
  end
end
