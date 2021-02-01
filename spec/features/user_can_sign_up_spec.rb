require 'rails_helper'

RSpec.describe "Timeline", type: :feature do
  it "returns http success" do
    visit "/"
    fill_in 'user[name]', with: "name"
    fill_in 'user[email]', with: "test@gmail.com"
    fill_in 'user[password]', with: "namepass"
    fill_in 'user[password_confirmation]', with: "namepass"
    click_button "Create User"
    expect(page).to have_current_path("/posts")
  end
end
