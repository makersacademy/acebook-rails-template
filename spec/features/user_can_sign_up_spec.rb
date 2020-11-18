require 'rails_helper'
RSpec.feature "Sign up", type: :feature do
  scenario "Can sign up" do
    add_new_user
    expect(page).to have_content("Test Person")
  end
end

