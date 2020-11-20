require 'rails_helper'

RSpec.feature "Homepage Button", type: :feature do
  scenario "User signs in, goes to create post page and clicks link to homepage" do
    user_signup('arakno', 'arakno@makers.com', 'Arabella Knowles', 'makers4L')
    click_link "New post"
    click_button("home")
    expect(page).to have_content("Logout")
  end
end