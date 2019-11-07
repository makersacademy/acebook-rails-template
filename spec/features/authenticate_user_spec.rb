# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'redirect to signup/login', type: :feature do
  scenario 'if user is not logged in they are redirected to log in page' do
    visit '/posts'
    expect(current_path).to eq('/users/sign_in')
    expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(page).to have_content('Password')
  end
end
