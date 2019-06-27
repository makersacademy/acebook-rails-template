# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Signin', type: :feature do
  before(:each) do
    sign_up(username: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    click_link('Sign out')
  end

  scenario "'Sign in' page has a form to sign in" do
    go_to_homepage
    click_link('Sign in')

    expect(page).to have_current_path('/sessions/new')
    expect(page).to have_content('Acebook')
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
    expect(page).to have_button('SIGN IN')
  end

  scenario 'User can sign in' do
    sign_in(email: 'test@test.com', password: 'password')

    user = User.all[0]
    expect(page).to have_current_path("/users/#{user.id}/posts")
    expect(page).to have_content('Welcome to Acebook by D-Railed!')
  end

  scenario 'User inputs wrong email in details' do
    sign_in(email: 'wrong_email@wtest.com', password: 'password')

    expect(page).to have_current_path('/sessions/new')
    expect(page).to have_content('Invalid email or password. ')
  end

  scenario 'User inputs wrong password in details' do
    sign_in(email: 'test@test.com', password: 'wrong_password')

    expect(page).to have_current_path('/sessions/new')
    expect(page).to have_content('Invalid email or password. ')
  end
end
