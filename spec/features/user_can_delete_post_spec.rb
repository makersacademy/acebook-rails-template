require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and delete them" do
    sign_up
    click_link "View posts"
    create_post
    click_link 'Destroy'
    expect(page).not_to have_content("Hello, world!")
  end
end