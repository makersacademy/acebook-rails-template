# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'A user can sign up' do
    sign_up
    expect(page).to have_content('Sign out')
  end
end
