require 'rails_helper'

RSpec.feature 'Profile', type: :feature do
  scenario 'Can view their own profile' do
    sign_in
    visit '/profile'
    expect(page).to have_content('Welcome to ConnectU')
  end

  scenario 'User can add post and view it on their own wall' do
    user = sign_in
    create_post('My new post')
    visit("/users/#{user.id}")
    expect(page).to have_content('My new post')
  end
end
