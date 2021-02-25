# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Submitted posts should show user' do
    visit '/users/sign_up'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'testpass'
    fill_in 'Password confirmation', with: 'testpass'
    click_button 'Sign up'
    create_a_new_post_and_see_it_on_the_feed("Hello, world!")
    expect(page).to have_content "test@email.com"
  end
end
