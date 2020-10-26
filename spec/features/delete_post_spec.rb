# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Delete", type: :feature do 
  scenario 'user can delete a post' do 
    sign_up
    add_new_post
    expect(page).to have_content("Hello, world!")
    click_link "Delete"
    expect(page).not_to have_content("Hello, world!")
  end 
end 
