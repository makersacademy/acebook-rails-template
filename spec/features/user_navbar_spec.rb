require 'rails_helper'

RSpec.feature 'Navbar', type: :feature do
  scenario 'User can click the Posts navbar link and view posts' do
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path
    click_link('navbar-posts')
    expect(page).to have_content('Posts')
  end

  scenario 'User can click sign up nav link and gets the sign up page' do
    visit root_path
    click_link 'navbar-sign-up'
    expect(page).to have_content 'Sign up'
  end

  scenario 'User can click sign in button and get the sign in page' do
    visit root_path
    click_link 'navbar-sign-up'
    click_link 'navbar-sign-in'
    expect(page).to have_content 'Log in'
  end
end
