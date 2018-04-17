# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  include ActiveSupport::Testing::TimeHelpers
  before(:each) do
    sign_up
    travel_to Time.zone.local(1991)
    add_new_post
  end

  scenario 'Can submit posts and view them' do
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Posts show creation timestamp' do
    expect(page).to have_content '00:00 Tuesday 01-01-1991'
  end
end
