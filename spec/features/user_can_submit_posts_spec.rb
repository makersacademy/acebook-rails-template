# frozen_string_literal: true

require 'rails_helper'
require 'helpers/users_helper_spec'

RSpec.feature 'Timeline', type: :feature do

  scenario 'Can submit posts and view them' do
    first_user
    first_user_sign_in
    expect(page).to have_content('I\'m Batman!!!')
  end

  scenario 'Can post a message and see the date' do
    first_user
    first_user_sign_in
    expect(page).to have_content(Time.now.strftime('%m/%d/%Y'))
  end

  scenario 'Can post a message and see username who posted' do
    first_user
    first_user_sign_in
    expect(page).to have_content('@BruceBatman')
  end
end
