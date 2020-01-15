require 'rails_helper'

RSpec.feature "Redirect to home" do
  scenario "it redirects to homepage if not signed in" do
    visit '/posts'
   
    expect(page).not_to have_content("Feed")
    expect(page).to have_content("Home")
  end
end

