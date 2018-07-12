# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "User creates an account", type: :feature do
  scenario 'successfully' do
    sign_up_successfully

    expect(page).to have_content("Sign Out")
  end
end
