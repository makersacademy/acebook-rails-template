# frozen_string_literal: true

require 'rails_helper'
require 'timecop'


RSpec.feature 'Timeline', type: :feature do
  scenario 'Posts are shown in reverse chronological order' do
    signup
    click_link 'New post'
    fill_in 'Message', with: 'My first post!'
    Timecop.freeze(1990)
    time_1 = Time.now
    click_button 'Submit'
    Timecop.return
    click_link 'New post'
    fill_in 'Message', with: 'My second post!'
    Timecop.freeze(1991)
    click_button 'Submit'
    time_2 = Time.now
    Timecop.return

    expect(page.find('li:nth-child(1)')).to have_content("My second post!")
  end
end
