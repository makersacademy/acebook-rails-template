require 'rails_helper'
require_relative '../support/helpers.rb'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Posts appear in chronological order' do
    sign_up
    add_post('Hello, world!')
    click_link 'New post'
    fill_in 'Message', with: 'Hello again world'
    click_button 'Submit'
    expect(page).to have_content('Hello again world')
  end
end
