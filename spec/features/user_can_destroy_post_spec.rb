require 'rails_helper'
require 'features_helper'

RSpec.feature "Destroy", type: :feature, js: true do
  scenario "Can delete own post" do
    signup
    login
    create_post
    click_link "Back"
    click_link "Destroy"
    page.driver.browser.switch_to.alert.accept
    expect(page).not_to have_content("Hello, world!")
  end
end
