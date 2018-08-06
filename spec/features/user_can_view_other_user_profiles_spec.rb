require 'rails_helper'

RSpec.feature "Edit Posts", type: :feature do

  before(:each) do
    first_user_post
    click_button "Log Out"
    second_user_post
  end

  scenario "A user can click on a username profile" do
    click_link "test_first_name"
    expect(page).to have_text('test_first_name\'s Profile')
  end

end
