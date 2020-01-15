require 'rails_helper'


RSpec.feature "Log out", type: :feature do
  scenario "Can log out as a user" do
    signup
    click_on "Logout"
    expect(@current_user == nil)
  end
end