require 'rails_helper'

RSpec.feature "User log in", type: :feature do
  scenario "Signed up users can log in" do
    create_user
    user_log_in
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
