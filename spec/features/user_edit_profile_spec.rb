require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can go to edit profile page" do
    sign_up_and_sign_in
    click_link "Settings"
    expect(page).to have_content('Edit User')
  end
end
