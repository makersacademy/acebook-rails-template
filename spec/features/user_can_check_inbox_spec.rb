# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Can view Inbox', type: :feature do
  sign_up
  click_link 'Inbox'
  expect(page).to have_content 'Your Conversations'
end
