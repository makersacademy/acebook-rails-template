# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'users can sign out', type: :feature do
  scenario 'users can sign out of Acebook' do
    visit '/'
    sign_up
    sign_out
    expect(page).to have_selector("input[type=submit][value='Login']")
  end
end
