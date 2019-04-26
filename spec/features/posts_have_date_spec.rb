# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Posts have creation dates", type: :feature do
  scenario "Posts have a posted date" do
    sign_up
    create_post message: "Hello, world!"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content(DateTime.now.strftime("%Y-%m-%d"))
  end
end
