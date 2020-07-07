require 'rails_helper'

RSpec.feature "wall", type: :feature do
  scenario "user goes users list", :focus => true do
    sign_up_with('email@eamil', 'testingName', "password")
    visit users_path
    expect(page).to have_content('testingName')
  end

end
