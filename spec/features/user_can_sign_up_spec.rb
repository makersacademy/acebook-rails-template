# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign Up', type: :feature do
  it 'User can sign up to acebook' do
    visit '/signup'
    expect(page).to have_content('Sign Up')
  end

  it 'User can sign up with a name' do
    log_in_eman
    expect(page).to have_content('Welcome to JJERbook')
  end

  it 'User can see link to profile' do
    log_in_eman
    expect(page).to have_link('Emanuele')
  end
end
