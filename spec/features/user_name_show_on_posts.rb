require 'rails_helper'

RSpec.feature "Post", type: :feature do
  scenario "Post owner's name appears on post" do
    sign_up_user
    visit "/"
    click_link "New Post"
    fill_in "Message", with: "Ay caramba, Amy!!"
    click_button "Submit"
    expect(page).to have_content("Amy said: Ay caramba, Amy!")
  end
end