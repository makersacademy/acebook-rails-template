# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'users can sign up', type: :feature do
  scenario 'user can register to Acebook' do
    sign_up
    expect(page).to have_selector("input[type=submit][value='Logout']")
  end
end
