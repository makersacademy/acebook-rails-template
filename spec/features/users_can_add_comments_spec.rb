require 'rails_helper'

RSpec.feature 'Adding comments', type: :feature do
  scenario 'You can add comments to a post ' do
    sign_up
    click_link 'New post'
    fill_in 'Message', with: 'post'
    click_button 'Submit'
    click_link "Comment"
    expect(page).to have_content "Add comment"
  end
end
