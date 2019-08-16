require 'rails_helper'
require_relative './sign_up_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    registration
    create_post
    expect(page).to have_content("Hi")
  end

  scenario "Can submit multi-line posts and view them" do
    registration
    create_post_multi_line
    expect(page.html).to include("Line one\n<br />Line Two")
  end
end
