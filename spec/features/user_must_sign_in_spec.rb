# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Not signing in', type: :feature do
  scenario 'non-signed-in cannot view posts' do
    visit '/posts'
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
