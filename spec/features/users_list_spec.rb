# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'View all users', type: :feature do
  scenario "Logged in user can see other acebook users" do
    signup_and_click
    logout
    second_user_signup_and_click
    click_on 'View All Acers'

    expect(page).to have_content('1')
  end
end
