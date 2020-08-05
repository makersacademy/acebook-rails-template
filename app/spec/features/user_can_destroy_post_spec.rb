require 'rails_helper'
require 'features_helper'

RSpec.feature "Destroy", type: :feature, js: true do
  xscenario "Can delete own post" do
    signup
    login
    click_link "New post"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Create Post"
    click_link "Back"
    click_link "Destroy"
    page.driver.browser.switch_to.alert.accept
    expect(page).not_to have_content("Hello, world!")
  end
end
