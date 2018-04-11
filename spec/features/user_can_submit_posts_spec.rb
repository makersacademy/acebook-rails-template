require 'rails_helper'
require_relative '../helpers/custom_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    create_post
    expect(page).to have_content("Hello, world!")
  end
end
