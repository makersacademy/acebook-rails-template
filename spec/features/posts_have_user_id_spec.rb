# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Posts have user id", type: :feature do
  scenario "Post has the user id" do
    sign_up email: "myemail@gmail.com"
    create_post
    expect(page).to have_content("myemail@gmail.com")
  end
end
