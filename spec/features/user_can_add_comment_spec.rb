require 'rails_helper'

RSpec.feature "Comment", type: :feature do
  scenario "Users can add comments to posts" do
    visit('/')
    create_user
    login_user
    create_post
    create_comment
    expect(page).to have_content('A comment')
  end
end
