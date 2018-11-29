require 'rails_helper'
RSpec.feature 'Creating Album', type: :feature do
  scenario 'user can view their albums' do
    sign_in_as_user
    click_link 'My Albums'
    expect(page).to have_content "Alice Bobson's Albums"
  end

  # scenario 'user can create an album' do
  #   sign_in_and_create_album
  #   expect(page).to have_link 'My first album'
  # end
  #
  # scenario "user can view another's albums" do
  #   sign_in_and_create_post
  #   click_link 'My Albums'
  #   click_link 'Create Album'
  #   fill_in 'album[title]', with: 'My first album'
  #   click_link 'Create'
  #   click_link 'Sign Out'
  #
  #   user_2 = create(:user)
  #   login_as(user_2, scope: :user)
  #   click_link 'Alice Bobson'
  #   click_link 'View Albums'
  #   expect(page).to have_link 'My first album'
  # end
end
