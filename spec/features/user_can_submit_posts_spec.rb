# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do

  scenario 'can create a post with a logged in user' do
    login_as create( :user ), scope: :user
    visit new_post_path
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
    expect( Post.count ).to eq(1)
    expect(page).to have_content('Hello, world!')
  end

  scenario 'cannot create a post if not logged in user' do
    login_as create( :user ), scope: :user
    sign_out :user
    visit new_post_path
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end

