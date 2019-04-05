# frozen_string_literal: true

require 'rails_helper'
require 'timecop'

RSpec.feature 'Can not update post adter ten minutes', type: :feature do
  scenario 'can not update post after ten minutes' do
    create_user
    click_link 'New post'
    fill_in 'Message', with: 'Testing User name'
    click_button 'Post'
    expect(page).to have_link('Update')
  end
end
