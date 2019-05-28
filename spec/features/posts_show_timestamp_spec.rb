# frozen_string_literal: true

require 'rails_helper'
require "web_helper"

RSpec.feature 'Timeline', type: :feature do
  scenario 'posts show the date and the hour they were created' do
    create_new_user
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world! Created on')
  end
end
