# frozen_string_literal: true

require 'rails_helper'

feature 'log in' do
  scenario 'user logs in from welcome page' do
    visit '/'
    click_link 'Log in'
    expect(page).to have_text 'Log in'
  end
end
