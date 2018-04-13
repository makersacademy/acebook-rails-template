require 'rails_helper'

RSpec.feature "Deleting", type: :feature do
  scenario "Can delete posts" do
    sign_up
    add_post
    expect(page).to have_content("Hello, world! - test@test.com")
  end
end
