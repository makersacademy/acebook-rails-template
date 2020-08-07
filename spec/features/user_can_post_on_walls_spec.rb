require 'rails_helper'
require 'features_helper'

RSpec.feature "Walls", type: :feature do
  scenario "Can submit posts and view them" do
    signup
    login
    create_post
    expect(page).to have_content("Hello, world!")
  end
end