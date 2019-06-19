require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "User can sign up" do
    signup
    expect(page).to have_content("Hello, Amoeba Boyz!")
  end
end
