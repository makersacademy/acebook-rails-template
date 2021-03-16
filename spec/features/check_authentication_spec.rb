# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'user needs to log in to view posts' do
    visit '/posts'
    expect(page).to have_content('Login')
  end
end
