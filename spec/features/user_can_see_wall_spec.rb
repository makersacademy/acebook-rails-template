# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Wall", type: :feature do
  scenario "Users can't see walls when not logged in" do
    create_user
    login_user
    create_post
    logout_user
    visit('/users/1')
    expect(page).not_to have_content('Hello, world!')
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario "Users can see their wall" do
    visit('/')
    create_user
    login_user
    create_post
    visit('/users/1')
    expect(page).to have_content('Hello, world!')
  end

  scenario "Users can see other's walls" do
    visit('/')
    create_user
    login_user
    create_post
    logout_user
    create_user_two
    login_user_two
    visit('/users/1')
    expect(page).to have_content('Hello, world!')
  end
end
