require 'rails_helper'
require_relative '../helpers/users_helper_spec'

RSpec.feature 'Visit own wall', type: :feature do
  scenario 'User redirected to wall after sign_up' do
    visit '/'
    sign_up
    expect(page.current_path).to eq('/users/davethecat@katze.com')
  end

  scenario 'User can only see own posts on their wall' do
    sign_up
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Sign Out'
    second_user_sign_up
    expect(page).not_to have_content "Hello, world!"
  end

  scenario "User posts on someone else's wall. That post doesn't appear on any other walls" do
    sign_up
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Sign Out'
    second_user_sign_up
    visit '/users/davethecat@katze.com'
    click_link 'New post'
    fill_in 'Message', with: 'Hi Dave!'
    click_button 'Submit'
    visit '/users/jane@gato.com'
    expect(page).not_to have_link("Hi Dave!")
    expect(page).not_to have_content("Hi Dave!")
  end
end
