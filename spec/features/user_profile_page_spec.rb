require 'rails_helper'

RSpec.feature 'profile page', type: :feature do
  scenario 'A user can visit thier own profile page' do
    register
    click_link 'Profile'
    expect(page).to have_content('Katy Day')
  end

  scenario 'A user can see only thier own posts on thier profile page' do
    register
    submit_post
    click_link "Sign out"
    register_second_user
    click_link 'Profile'
    expect(page).to have_content('John Smith')
    expect(page).not_to have_content('Katy Day')
    expect(page).not_to have_content('Hello, world!')
  end
end
