require 'rails_helper'

RSpec.feature 'User profile', type: :feature do

  before do
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path
  end

  scenario 'user can sign out successfully' do
    click_link 'Profile'
    expect(page).to have_content 'Alice Bobson'
  end
end
