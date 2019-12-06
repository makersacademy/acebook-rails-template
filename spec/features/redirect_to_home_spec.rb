# frozen_string_literal: true

require 'rails_helper'

feature 'redirect to home page' do
  scenario 'when user is not logged in' do
    visit '/posts'
    expect(page).to have_text 'Welcome to DashBook'
  end
end
