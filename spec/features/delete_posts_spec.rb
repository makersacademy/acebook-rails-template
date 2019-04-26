require 'rails_helper'
require 'sign_up_helper'

 RSpec.feature "Delete posts", type: :feature do
  Capybara.current_driver = :selenium
  scenario "user can delete an existing post" do
    create_user_and_sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "This message is going to be deleted!"
    click_button "Submit"
    click_button "Delete"
    page.driver.browser.switch_to.alert.accept
    expect(page).not_to have_content "This message is going to be deleted!"
  end
end