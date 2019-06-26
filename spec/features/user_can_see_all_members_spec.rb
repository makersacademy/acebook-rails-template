# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Members page', type: :feature do
  scenario 'User can visit member list page' do
    sign_up(
      username: 'test',
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    click_link('Members')

    expect(page).to have_content('Acebook member list')
  end

  scenario 'User can see all member usernames as links' do
    sign_up(
      username: 'test1',
      email: 'test1@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    click_link('Sign out')
    sign_up(
      username: 'test2',
      email: 'test2@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    click_link('Sign out')
    sign_up(
      username: 'test3',
      email: 'test3@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    click_link('Members')

    expect(page).to have_link('test1')
    expect(page).to have_link('test2')
    expect(page).to have_link('test3')
  end

  scenario 'User can click on a username and is taken to their wall' do
    sign_up(
      username: 'test',
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    click_link('Members')
    click_link('test')

    expect(page).to have_link('New post')
  end
end