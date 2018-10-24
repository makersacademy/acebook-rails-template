require 'rails_helper'

RSpec.feature 'Like posts', type: :feature do
 scenario 'Like post counter' do
   create_hello_world_post
   expect(page).not_to have_content('Likes: 1')
   click_button 'Like'
   expect(page).to have_content('Likes: 1')
 end
end