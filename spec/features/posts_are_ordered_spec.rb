# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Posts are ordered", type: :feature do
  scenario "Posts are ordered by newest first" do
    sign_up
    create_post message: "First post"
    create_post message: "Second post"
    expect(page.body.index("Second post")).to be < page.body.index("First post")
  end
end
