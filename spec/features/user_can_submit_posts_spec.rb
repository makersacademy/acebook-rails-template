# frozen_string_literal: true

require 'rails_helper'
require 'selenium-webdriver'

RSpec.feature 'Timeline', type: :feature do
  before(:each) do
    @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
    @user.save
    sign_in_helper(@user)
  end

  scenario 'Can submit posts and view them' do
    visit '/posts'
    click_button 'New post'
    fill_in 'post[message]', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end

  scenario "Can't view all posts if not signed in" do
    click_link("Sign out")
    visit '/posts'
    expect(page).to have_content('You must be signed in to view that page!')
    expect(current_path).to eq('/')
    visit('posts/new')
    expect(page).to have_content('You must be signed in to view that page!')
    expect(current_path).to eq('/')
  end

  scenario "Can't make new posts if not signed in" do
    click_link("Sign out")
    visit('posts/new')
    expect(page).to have_content('You must be signed in to view that page!')
    expect(current_path).to eq('/')
  end

  scenario  "posts have a nametag" do
    visit '/posts'
    click_button 'New post'
    fill_in 'post[message]', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content(@user.name)
  end
end
