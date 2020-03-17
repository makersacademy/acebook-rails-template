require 'rails_helper'

RSpec.feature "Liking posts", type: :feature do
  scenario "User can like posts" do
    sign_up
    visit "/posts/"
    p @user
    click_link("like")
    expect(page).to have_content("liked")
  end
end
