# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'redirected to login page if not already logged in' do
    visit '/'
    expect(page).to have_content('You need to sign in ot sign up before continuing.')
    visit '/posts'
    expect(page).to have_content('You need to sign in ot sign up before continuing.')
  end
end
