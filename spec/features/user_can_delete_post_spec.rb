require 'rails_helper'

RSpec.feature "Delete", type: :feature do
  scenario "Can delete posts" do
    sign_up_and_log_in
    create_post

    click_link "Delete"

    expect(page).not_to have_content("Hello, world!")
  end
end
