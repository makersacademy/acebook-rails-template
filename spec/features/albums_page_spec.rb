require 'rails_helper'

RSpec.feature "Albums page", type: :feature do

  scenario "user can visit the albums page" do
    sign_up_helper('photo@check.com','123456')
    visit '/albums'
    expect(page).to have_content("Albums")
  end
end
