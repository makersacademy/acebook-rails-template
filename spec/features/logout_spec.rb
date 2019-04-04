require 'rails_helper'

RSpec.feature "Logout", type: :feature do
  

  scenario "A user can logout" do
    visit '/signup'
    fill_in 'signup[username]', with: "Foo"
    fill_in 'signup[password]', with: "Bar"
    fill_in 'signup[email]', with: "Foo@Bar.com"
    click_button "Submit"
    click_button "Logout"
    expect(current_path).to eq "/signin"
  end
end
