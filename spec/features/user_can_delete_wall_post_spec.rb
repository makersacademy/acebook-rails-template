require 'rails_helper'

feature 'wall posts', type: :feature do
  before do
    sign_up
    create_wall_post
  end

  feature 'delete wall post' do
    scenario 'user can delete wall post' do
      # save_and_open_page
      click_link 'Delete'
      expect(page).not_to have_content 'Post on my wall'
      expect(page).to have_content 'Amy Smith - Wall'
    end
  end

end
