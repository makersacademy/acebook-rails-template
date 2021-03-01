# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User login', type: :feature do
  scenario 'User visits the home page and can see a login option' do
    visit '/'
    expect(page).to have_content('Timeline')
  end
end
