require 'rails_helper'
require 'web_helpers'

RSpec.feature 'Commenting', type: :feature do

  scenario 'user can comment on posts' do
    user_1 = FactoryBot.create(:user)
    signin(user_1)
    create_post
    click_link '💬'
    fill_in 'Comment', with: 'Comment1'
    click_button 'Comment'
    expect(page).to have_content 'Comment1'
  end

end
