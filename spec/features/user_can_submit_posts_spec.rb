require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit_page_and_post
    expect(page).to have_content("Hello, world!")
  end

  scenario "Post displays the time and date created" do
    visit_page_and_post
    expect(page).to have_content(DateTime.now.strftime("%H:%M %a %e %b %Y"))
  end


end
