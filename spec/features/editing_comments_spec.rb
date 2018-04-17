# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Editing comments', type: :feature do
  include ActiveSupport::Testing::TimeHelpers
  before(:each) do
    sign_up
    add_new_post
    travel_to Time.zone.local(1991, 5, 27, 00, 00, 00)
    add_comment
    click_link 'Edit Comment'
    fill_in 'comment[body]', with: 'Makers is great'
    click_button 'Update Comment'
  end

  scenario 'editing a comment updates comment body' do
    expect(page).to have_content 'Makers is great'
  end

  scenario 'editing a comment removes old comment body' do
    expect(page).not_to have_content 'Rails is awesome'
  end

  scenario 'editing a comment does not change the comment timestamp' do
    expect(page).to have_content "1991-05-27 01:00:00"
  end
end
