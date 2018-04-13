require 'rails_helper'

RSpec.feature "Navigation", type: :feature do
  scenario "Can click back on the new post page" do
    visit "/posts/new"
    click_link "Back"
    expect(page).to have_content("Acebook")
  end
end
