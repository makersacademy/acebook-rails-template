require 'rails_helper'
RSpec.feature "adding like to post" do
  scenario "user can like each post" do
    sign_up
    new_post
    click_link 'Show'
    click_button 'Like'
    expect(page).to have_content'1 Like'
  end
end
