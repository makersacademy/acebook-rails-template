require "rails_helper"
require "./spec/helpers/sign_up_helper"

RSpec.feature "Routing", type: :feature do
  scenario "After signing in visiting '/' direct to 'user/posts'" do
    sign_up
    visit "/"
    expect(page).to have_content("New post")
  end
end
