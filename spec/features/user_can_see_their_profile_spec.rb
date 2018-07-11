require 'rails_helper'

RSpec.feature "User can view their profile", type: :feature do
  scenario 'successfully' do
    sign_up_successfully

    click_link 'View profile'
    expect(page).to have_content("Type of Animal:")
    expect(page).to have_content("Age:")
    expect(page).to have_content("Owner:")
  end
end
