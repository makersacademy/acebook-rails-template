# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'View all users', type: :feature do
  scenario "Logged in user can see a list of other acers" do
    signup_and_click
    logout
    second_user_signup_and_click
    click_on 'View All Acers'

    expect(page).to have_content('1')
  end

  scenario "Logged in user can view the wall of another acer" do
    signup_and_click
    logout
    second_user_signup_and_click
    click_on 'View All Acers'
    click_on '1'

    expect(page.current_path).to eql '/users/1'
  end
end
