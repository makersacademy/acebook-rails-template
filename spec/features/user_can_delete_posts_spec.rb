require 'rails_helper'

RSpec.feature "Delete post", type: :feature do
  scenario "Can delete posts" do
    create_user
    login_user
    visit '/posts'
    create_post
    click_button "Delete"
    a = page.driver.browser.switch_to.alert
    a.accept
    expect(page).to have_no_content("Hello, world!")
  end
end
