require "rails_helper"

RSpec.feature "People can comment on posts", type: :feature do
  scenario "click on comment within post and see the empty comment thread" do
    seed_post
    sign_up
    find_link("Comment").click
    expect(page).to have_content "Hello, giraffe!"
    expect(page).to have_css '.comment-thread'
    expect(page).to have_link("Show Comments (0)", visible: false)
  end
end
