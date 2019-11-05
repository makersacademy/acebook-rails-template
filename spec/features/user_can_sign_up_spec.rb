# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  scenario 'Can sign up and log in' do
    signing_up

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
