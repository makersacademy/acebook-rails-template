# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Posts have username", type: :feature do
  scenario "Post has the username" do
    sign_up username: "Hives"
    create_post
    within(".post-author") do
      expect(page).to have_content("Hives")
    end
  end
end
