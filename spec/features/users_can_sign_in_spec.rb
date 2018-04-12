# frozen_string_literal: true

require 'rails_helper'
require_relative 'web_helper.rb'

RSpec.feature 'users can sign in', type: :feature do
  scenario 'user can sign in to their Acebook account' do
    sign_up
    sign_out
    sign_in
    expect(page).to have_selector("input[type=submit][value='Logout']")
  end
end
