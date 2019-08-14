require 'rails_helper'

RSpec.feature "View profile", type: :feature do
  scenario "Once signed up can view profile" do
    @user = User.create(firstname: "Zizi", surname: "Dweng", email: "zizidweng@email.com", password: "harryisok")
    visit("/users/#{@user.id}")
    click_button 'Edit Profile'
    fill_in "user[firstname]", with: "Zizi"
    fill_in "user[surname]", with: "White"
    fill_in "user[email]", with: "ziziwhite@email.com"
    fill_in "user[password]", with: "harryistheworst"
    expect(page).to have_content("Zizi")
    expect(page).to have_content("White")
    expect(page).to have_content("ziziwhite@email.com")
    expect(page).to have_content("Password")
  end
end
