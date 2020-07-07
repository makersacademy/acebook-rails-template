# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'friendslist', type: :feature do
  scenario 'Can view friends page' do
    log_in_eman
    click_link 'Emanuele'
    expect(page).to have_content("Profile Page")
  end
end
