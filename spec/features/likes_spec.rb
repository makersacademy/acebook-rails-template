require 'rails_helper'

RSpec.feature "Liking", type: :feature do

  before(:each) do
    sign_up
    add_post
    click_link "View Comments"
  end

  scenario "Can like post and view immediately" do
    click_button 'Like'
    expect(page).to have_content("1 Like")
  end

end
