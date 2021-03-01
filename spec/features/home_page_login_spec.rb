# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User login', type: :feature do
  it 'User visits the home page and can see a login option' do
    visit '/'
    expect(page).to have_content('Timeline')
  end
end
