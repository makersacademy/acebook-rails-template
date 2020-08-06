require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    signup
    login
    create_post
    expect(page).to have_content("Hello, world!")
  end
end
