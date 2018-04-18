require 'rails_helper'

RSpec.feature 'can see profile link', type: :feature do
  scenario 'link takes you to a users profile' do
    sign_up
    click_link 'Profile'
    expect(page).to have_content "Tom's Profile"
  end
end
