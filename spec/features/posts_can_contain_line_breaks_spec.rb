require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "submitted with line breaks in them are shown with those line breaks" do
    user_signup('arakno', 'arakno@makers.com', 'Arabella Knowles', 'makers4L')
    click_link "New post"
    fill_in "Message", with: "Hello,\nworld!"
    click_button "Submit"
    expect(page).to have_content("Hello,\nworld!")
  end
end