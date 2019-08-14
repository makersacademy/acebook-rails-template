require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    create_post
    expect(page).to have_content("Hi")
  end

  scenario "Can submit multi-line posts and view them" do
    create_post_multi_line
    expect(page).to have_content("Line one \nLine Two")
  end
end
