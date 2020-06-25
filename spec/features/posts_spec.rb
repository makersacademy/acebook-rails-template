require 'rails_helper'
require 'web_helpers'

RSpec.feature "Posts", type: :feature do
  scenario "user can upload a file" do
    sign_up
    fill_in 'Message', with: 'Test'
    attach_file 'Choose file', /storage/d1/Dg/d1DgaqX27R6jB3gTTRwXYJms
    click_button "Submit"
    expect(page).to has_link?("View Download")
  end

end
