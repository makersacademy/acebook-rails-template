require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "Can sign in" do
    User.create(email: "test@example.com", password: "test1234")
    visit "/"
    login
    expect(page).to have_content("Signed in successfully.")
  end
end
