require 'rails_helper'

RSpec.feature 'Sign out', type: :feature do

   before do
     user = create(:user)
     login_as(user, scope: :user)
     visit root_path
    end
    scenario 'user can sign out successfully' do
      click_link 'Sign out'
      expect(page).to have_content 'Log in'
    end
end
