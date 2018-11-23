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

  scenario 'user can edit their comment' do
    user_1 = FactoryBot.create(:user)
    signin(user_1)
    create_post
    click_link 'Comment'
    fill_in 'Comment', with: 'Comment1'
    click_button 'Comment'
    visit '/posts/1/comments/1/edit'
    fill_in 'Comment', with: 'Changed Comment'
    click_button 'Save changes'
    expect(page).to have_content('Changed Comment')
  end

  scenario "user cannot edit another person's comment" do
    user_1 = FactoryBot.create(:user)
    signin(user_1)
    create_post
    click_link 'Comment'
    fill_in 'Comment', with: 'Comment1'
    click_button 'Comment'
    user_2 = FactoryBot.create(:user)
    signin(user_2)
    visit '/posts/1/comments/1/edit'
    fill_in 'Comment', with: 'Changed Comment'
    click_button 'Save changes'
    expect(page).to have_content('Fuck off, this is not yours!')
  end

end
