require 'rails_helper'

RSpec.feature "wall", type: :feature do
  scenario "user can delete their own posts" do
    sign_up_with('email@eamil', 'testingName', "password")
    expect(page).to have_content('wall of, testingName')
  end

  scenario "user can delete their own posts" do
    sign_up_with('email@eamil', 'testingName', "password")
    sign_out
    sign_in_with('email@eamil', "password")
    expect(page).to have_content('wall of, testingName')
  end

end
