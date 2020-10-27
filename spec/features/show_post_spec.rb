# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'View post', type: :feature do
  scenario 'Shows the content of the post that the user clicks on' do
    sign_up
    add_new_post
    click_link 'Show'
    expect(page).to have_content 'Hello, world'
  end
end
