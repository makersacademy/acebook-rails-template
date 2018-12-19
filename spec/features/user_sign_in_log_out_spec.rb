require 'rails_helper'

RSpec.feature "User interactions", type: :feature do
  scenario "User can sign up" do
    signup
    expect(page).to have_content("first name")
  end

  scenario "User can Log Out" do
    signup
    find(:linkhref, "/users/sign_out").click
    expect(page).not_to have_content("first name")
  end

  xscenario "User can sign up, log out, log in" do
    signup
    expect(page).to have_content("first name")
    find(:linkhref, "/users/sign_out").click
    expect(page).not_to have_content("first name")
    find(:linkhref, "/login").click
    fill_in "user_email", with: 'test@email.com'
    fill_in "user_password", with: "password"
    within 'form-group' do
      find('input[name="commit"]').click
    end
    expect(page).to have_content("first name")
  end
end
