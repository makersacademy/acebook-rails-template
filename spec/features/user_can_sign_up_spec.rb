require 'rails_helper'
require_relative './sign_up_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "User can sign up" do
    registration
    expect(page).to have_content("Welcome to Acebook")
  end
end
