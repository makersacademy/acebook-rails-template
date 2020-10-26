require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up
    add_new_post
    expect(page).to have_content("Hello, world!")
  end
end
