# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Edit post', type: :feature do
  scenario 'user can edit their post' do
    sign_up
    add_new_post
    click_link 'Edit post'
    find_field('post[message]').set 'Goodbye, world'
    click_button 'Submit'
    expect(page).not_to have_content 'Hello, world'
    expect(page).to have_content 'Goodbye, world'
  end

  scenario "user cannot edit another's post" do
    sign_up
    add_new_post
    click_link 'Logout'
    sign_up_second_user
    click_link 'Edit post'
    expect(page).to have_content "That post doesn't belong to you"
  end
end
