# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User logs out', type: :feature do
  scenario 'the user logs out' do
    sign_up_jackbert
    click_link 'Logout'
    expect(current_path).to eq('/users/sign_in')
  end
end
