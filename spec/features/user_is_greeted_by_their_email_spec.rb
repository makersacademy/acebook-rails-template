# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  xscenario 'Can be greeted by their email' do
    signup
    visit '/'
    expect(page).to have_content('Hello test')
  end
end
