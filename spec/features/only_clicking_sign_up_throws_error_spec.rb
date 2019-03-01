require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "only clicking on Sign Up throws an error" do
    visit "/users/sign_up"
    fill_in "user[email]", with: ""
    fill_in "user[password]", with: ""
    fill_in "user[password_confirmation]", with: ""
    click_button ("Sign up")
    expect { click_button ("Sign up") }.to raise_error("Missing field data")
  end
end
