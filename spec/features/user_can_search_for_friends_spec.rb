# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Friends search', type: :feature do
  before :each do
    createUser
    signin
  end

  scenario 'user can search for friends' do
    visit 'friendships/search'
    fill_in 'search', with: 'Sam A'
    click_button 'submit'
    expect(page).to have_content 'Sam A'
  end

  scenario 'user cannot add the same friend twice' do
    addFriend
    visit 'friendships/search'
    fill_in 'search', with: 'Sam A'
    click_button 'submit'
    expect(page).to have_content 'Already friends!'
  end
end
