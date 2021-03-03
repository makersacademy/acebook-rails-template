require 'rails_helper'

RSpec.feature 'User settings', type: :feature do
  scenario 'User can visit the settings page' do
    sign_up(email: 'test@email.com', username: 'Troy', password: 'testpass')
    click_link "Settings"
    expect(page).to have_current_path('/users/edit')
  end

  scenario 'User can delete their own Profile' do
    sign_up(email: 'test@email.com', username: 'Troy', password: 'testpass')
    create_a_new_post_and_see_it_on_the_feed("Hello world!")
    click_link "Settings"
    click_button "Cancel my account"
    sign_up(email: 'test2@email.com', username: 'Troy', password: 'testpass')
    expect(page).not_to have_content("Hello world!")
  end

end
