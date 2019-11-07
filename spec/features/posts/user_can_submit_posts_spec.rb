require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    log_in_test_user
    submit_post("Hello, world!")
    expect(page).to have_content("Hello, world!")
  end
end
