require 'rails_helper'
require 'feature_helpers'

RSpec.feature "Timeline", type: :feature do
    scenario "Can delete posts" do
      register
      click_link "New post"
      post_something
      expect(page).to have_content("Hello, world!")
      click_link ("Delete")
      expect(page).not_to have_content("Hello, world!")
    end
  end
