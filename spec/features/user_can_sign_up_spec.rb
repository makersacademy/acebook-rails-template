require 'rails_helper'
require './helpers'

RSpec.feature "Login", type: :feature do
  scenario "The user can sign up successfully" do
    user_signs_up
    expect(page).to have_content("Signup successful, welcome jordan@matt.com")
  end

end
