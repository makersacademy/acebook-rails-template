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
    expect(page).to have_link('Like')
  
    # find('Like').click
    # find('#like-btn')
    this = page.find_by_id('like')
    this.click
    # page.find_by_id('like-btn').click
    # expect(page).to have_content('Liked')

    # click_link('Like')  
    expect(page).to have_content('Liked')
  end
end
