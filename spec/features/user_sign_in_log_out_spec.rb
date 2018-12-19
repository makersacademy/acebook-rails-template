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
end
