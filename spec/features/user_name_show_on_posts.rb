require 'rails_helper'

RSpec.feature "Post", type: :feature do
  scenario "Email appears on post" do
    sign_up_user
    visit "/"
    click_link "New post"
    fill_in "Message", with: "Ay caramba, Amy!!"
    click_button "Submit"
    expect(page).to have_content("test@test.com said: Ay caramba, Amy!")
  end
end