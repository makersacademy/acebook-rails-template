require 'rails_helper'
require 'web_helpers'

RSpec.feature "Forum", type: :feature do
  scenario "users can create a category and submit a post" do
      sign_up_mentor
      create_category
      click_link "Ask A Question"
      select "Exams", from: "Choose a Category"
      fill_in 'Title', with: 'Testing'
      fill_in "What do you need help with?", with: "How do i test?"
      click_button "Ask Your Question"
      expect(page).to have_content("How do i test?")
  end
end
