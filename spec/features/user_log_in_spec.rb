require 'rails_helper'
require 'helpers/create_user'
require 'helpers/user_log_in'
require 'pry'

RSpec.feature "User log in", type: :feature do
  scenario "Signed up users can log in" do
    create_user
    user_log_in
    binding.pry
    expect{page}.not_to raise_error
  end

  scenario "Not signed-up users can't log in" do
    create_user
    incorrect_user_log_in
    expect(page).to have_content "Invalid email/password combination"
  end

  scenario "Flash message persists for one request" do
    create_user
    incorrect_user_log_in
    expect(page).to have_content "Invalid email/password combination"
    visit "/"
    expect(page).not_to have_content "Invalid email/password combination"
  end
end
