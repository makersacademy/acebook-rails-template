require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  context "Form data" do

    scenario "it has an email field" do
      go_to_homepage

      expect(page).to have_field("user[email]") 
    end

    scenario "it has a password field" do
      go_to_homepage

      expect(page).to have_field("user[password]") 
    end
  end

  scenario "after completing the signup form it navigates to posts page" do
    sign_up(email: "test@test.com", password: "password")

    expect(page).to have_current_path("/posts")
  end

end
