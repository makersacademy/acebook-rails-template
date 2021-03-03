require 'rails_helper'

RSpec.feature 'Friends', type: :feature do
  scenario 'A signed up user can add a friend' do
    register
    submit_post
    click_link 'Sign out'
    register_second_user
    click_link 'Katy Day'
    click_link 'Be my friend'
    expect(page).to have_content('You and Katy are now friends')
  end

  scenario "A signed up user once they have added a friend can see their name in friends list" do
    register
    submit_post
    click_link 'Sign out'
    register_second_user
    click_link 'Katy Day'
    click_link 'Be my friend'
    expect(page).to have_content("Katy's Friends")
    expect(page).to have_content("John Smith")
  end
end
