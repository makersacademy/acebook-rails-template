require 'rails_helper'

RSpec.feature "User redirected to newsfeed on login", type: :feature do
  scenario "successfuly" do
    visit root_path
    fill_in "Email", with: 'millie@gmail.com'
    fill_in "Password", with: "Secure123"
    click_button "Submit"
    expect(page.current_url).to eq("https://localhost:3000/posts")
  end
end
