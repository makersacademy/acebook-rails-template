require 'rails_helper'

RSpec.describe "Timeline", type: :feature do
  scenario "User wants to delete a post that has been liked" do
    sign_up
    create_post
    my_link = find(:xpath, "//a[contains(@href,'/like')]")
    my_link.click
    click_link 'Delete Post'
    expect(page).not_to have_content("Hello, world!")
  end
end
