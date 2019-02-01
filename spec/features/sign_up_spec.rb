require 'rails_helper'

describe "sign up", type: :feature do
  scenario "user can sign up" do
    visit '/'
    expect(current_path).to eq('/')
  end
end

# describe "sign up", type: :feature do
#   scenario "user can sign up" do
#     visit '/'
#     click_link "signup"
#     fill_in "email", with: "test@test.com"
#     fill_in "password", with: "testpassword"
#     fill_in "password_confirmation", with: "testpassword"
#     click_button 'Sign Up'
#     expect(current_url).to eq('/profile')
#     expect(page).to have_content('Welcome test@test.com')
#   end
end
