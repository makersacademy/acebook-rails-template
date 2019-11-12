require 'rails_helper'

RSpec.feature "Comment", type: :feature do
  scenario "Users can edit their own comments" do
    pending
    visit('/')
    create_user
    login_user
    create_post
    create_comment
    edit_comment
    expect(page).to have_content('An edited comment')
  end
end
