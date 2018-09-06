# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do

  scenario 'Standard User can edit own post' do
    # login_as create( :user ), scope: :user
    # visit new_post_path
    
    # attach_file('post[postimage]', "./files/images/caffeine-coffee-cup-6347.jpg")
    # fill_in 'post[message]', with: 'Hello, world!'
    # click_button 'Create Post'
    # expect(page).to have_content('Hello, world!')
    # expect( Post.count ).to eq(1)
    # expect(page).to have_content('Hello, world!')
  end

  scenario 'Standard User cannot edit someone else post' do
    # login_as create( :user ), scope: :user
    # sign_out :user
    # visit new_post_path
    # expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

  scenario 'Superuser can edit someone else post' do
    # login_as create( :user ), scope: :user
    # sign_out :user
    # visit new_post_path
    # expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end