require 'rails_helper'

RSpec.feature 'User Profle', type: :feature do
  scenario 'User can visit their own Profile page' do
    sign_up(email: 'test@email.com', password: 'testpass')
    click_link "Profile"
    expect(page).to have_current_path('/users/edit')
  end

  scenario 'User can delete their own Profile' do
    sign_up(email: 'test@email.com', password: 'testpass')
    create_a_new_post_and_see_it_on_the_feed("Hello world!")
    click_link "Profile"
    click_button "Cancel my account"
    sign_up(email: 'test2@email.com', password: 'testpass')
    expect(page).not_to have_content("Hello world!")
  end 

end
