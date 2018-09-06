# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'After login/signup', type: :feature do
  scenario 'Can submit posts' do
    visit('/')
    sign_up
    create_post
    expect(page).to have_content('Hello, world!')
  end
end
