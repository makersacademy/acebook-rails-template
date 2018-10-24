require 'rails_helper'

RSpec.feature 'Like posts', type: :feature do
 scenario 'Like post counter' do
  signup
  create_hello_world_post
  expect(page).not_to have_content('1 Like')
  click_button 'Like'
  expect(page).to have_content('1 Like')
 end
end