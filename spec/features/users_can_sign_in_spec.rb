# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'users can sign in', type: :feature do
  scenario 'to their Acebook account' do
    sign_up
    sign_out
    sign_in
    expect(page).to have_selector("input[type=submit][value='Logout']")
  end
end
