require 'rails_helper'
require_relative './method_helpers'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    create_post
    visit '/posts'
    click_on "Delete"
    expect(page).not_to have_content("Hi")
  end
end
