# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Remove friend', type: :feature do
  before :each do
    createUser
    signin
    addFriend
  end

  scenario 'user can search for friends' do
    click_link 'My profile'
    click_link 'Unfriend'
    expect(page).not_to have_content 'Sam A'
  end

end
