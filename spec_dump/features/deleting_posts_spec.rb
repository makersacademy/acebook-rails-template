require 'rails_helper'
require 'web_helpers'

RSpec.feature 'Timeline', type: :feature do

  scenario 'user can delete a post' do
    signup
    create_post
    find("a[id=delete-1]").click
    expect(page).not_to have_content('Hello, world!')
  end

  scenario 'user can only delete their own posts' do
    user_1 = FactoryBot.create(:user)
    signin(user_1)
    create_post
    visit('/logout')
    user_2 = FactoryBot.create(:user)
    signin(user_2)
    expect(page).not_to have_content("❌")
  end

end
