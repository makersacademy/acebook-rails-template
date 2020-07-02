require 'rails_helper'
require_relative '../support/features/post_helpers.rb'

RSpec.feature "Delete", type: :feature do
  scenario "user can delete their own posts" do
    creates_a_post
    click_link 'delete'
    expect(page).to_not have_content(/bob1.*Hello, world!/)
  end

  scenario "user can not delete another user's post" do
    creates_a_post
    click_on "Sign out"
    sign_in
    click_link "delete"
    expect(page).to have_content("Cannot change another user's post")
  end
end
