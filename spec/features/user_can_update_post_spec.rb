# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do

  before do
    sign_up
  end

  scenario 'Can update post after creating it' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Edit'
    fill_in 'Message', with: 'Bye, world!'
    click_button 'Submit'
    expect(page).to have_content('Bye, world!')
    expect(page).to have_content(Time.now.strftime('%I:%M %p'))
  end

  scenario "Cannot update a post that's not her own" do
    sign_up
    create_post
    log_out
    sign_up_as_second_user
    visit '/posts'
    click_link 'Edit'
    expect(page).to have_content('You can only edit your own posts')
    log_out
    expect(page).to_not have_content('You can only edit your own posts')
  end
end
