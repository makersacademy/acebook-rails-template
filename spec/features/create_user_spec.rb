require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User can sign up" do
    visit "/user/new"
    within('form') do
    fill_in "username", with: "johnny"
    fill_in "email", with: "johnny@gmail.com"
    fill_in "firstname", with: "John"
    fill_in "lastname", with: "Doe"
    fill_in "password", with: 12345
    fill_in "dateofbirth", with: 20/10/1992
    end 
    click_on "Create Account!"
    expect(current_path).to eq "/posts"
  end
end