# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Messenger', type: :feature do
  scenario 'User can check who is online' do
    sign_up
    click_link 'Messenger'
    expect(page).to have_content 'Users Online'
  end
end
