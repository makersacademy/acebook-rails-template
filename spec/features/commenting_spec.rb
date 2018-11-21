require 'rails_helper'

RSpec.feature 'Commenting', type: :feature do
  let(:post) { build(:post) }

  before do
    user = create(:user)
    login_as(user, scope: :user)
  end
  scenario 'making a comment' do
    visit '/posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'This is a test post!'
    click_button 'Create Post'
    visit '/posts'
    click_link 'Comment'
    fill_in 'comment[body]', with: 'A comment'
    click_button('Comment')
    expect(page).to have_content('A comment')
  end
end
