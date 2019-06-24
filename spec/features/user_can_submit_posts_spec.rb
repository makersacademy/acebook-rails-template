# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    sign_up(email: 'test@test.com', password: 'password')
    add_post(message: 'Hello, world!')

    expect(page).to have_content('Hello, world!')
  end
end
