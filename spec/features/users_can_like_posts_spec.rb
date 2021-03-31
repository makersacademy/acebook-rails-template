require 'rails_helper'

feature 'Likes & Dislikes' do
  before(:each) do
    @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
    @user.save
    @user2 = User.new(name: "Lizardi", email: "lizardi@example.com", password: "123secure", password_confirmation: "123secure")
    @user2.save
    sign_in_helper(@user)
    click_link "New Post"
    fill_in "post[message]", with: "Hello Lizard"
    click_button "Submit"
  end

  scenario "can like a post" do
    click_button "👍"
    expect(page).to have_content("1 🦎")
  end

  scenario "can unlike a post" do
    click_button "👍"
    click_button "👍"
    expect(page).not_to have_content("1 🦎")
  end

  scenario "cannot like twice the same post" do
    click_button "👍"
    expect(page).to have_button("👍")
    page.assert_selector('[class="dislikebutton"]')
    page.assert_no_selector('[class="likebutton"]')
  end

  scenario "a second user can like the post too" do
      click_button "👍"
      click_link "Sign out"
      sign_in_helper(@user2)
      click_link "All Posts"
      click_button "👍"
      expect(page).to have_content("2 🦎")
  end

end
