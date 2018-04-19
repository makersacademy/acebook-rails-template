require 'rails_helper'
RSpec.feature "unlike the post" do
  scenario "user can unlike the post" do
    sign_up
    new_post
    click_link 'Show'
    click_button 'Like'
    click_button 'Unlike'
    expect(page).to have_content '0 Likes'
  end
end
