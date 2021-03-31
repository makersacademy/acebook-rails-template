require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
  sign_up_and_log_in
  create_post
    expect(page).to have_content("Hello, world!")
  end
end
