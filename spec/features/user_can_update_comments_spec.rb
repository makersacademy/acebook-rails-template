# frozen_string_literal: true

require 'rails_helper'
require 'timecop'

feature 'update comments' do

  before do
    sign_up
    create_post
    create_comment
  end

  scenario 'user can update existing comment after creating' do
    within('.comment') do
      click_link 'Edit'
      end
      fill_in 'Body', with: 'Updated comment'
      click_button 'Submit'
      expect(page).to have_content 'Updated comment'
  end
end
