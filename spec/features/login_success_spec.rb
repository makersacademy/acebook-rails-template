require 'rails_helper'

RSpec.feature "HomePage", type: :feature do 
  scenario "Login success" do 
    login
    expect(page).to have_content("Welcome to Acebook you are logged in as: BigJD")
  end
end
