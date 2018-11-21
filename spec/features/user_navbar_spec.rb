require 'rails_helper'

RSpec.feature 'Navbar', type: :feature do
  scenario 'User can click the Posts navbar link and view posts' do
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path
    click_link('navbar-posts')
    expect(page).to have_content('Listing posts')
  end
end
