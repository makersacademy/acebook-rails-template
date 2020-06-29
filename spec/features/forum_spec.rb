require 'rails_helper'
require 'web_helpers'

RSpec.feature "Forum", type: :feature do
  scenario "users can submit a post" do
    sign_up_mentor
    click_link "Forum"
    save_and_open_page
    # within ".card card-body" do
      click_link "Ask A Question"
    # end
    select "General", :from => "Choose a Category"
    fill_in 'Title', with: 'Testing'
    fill_in "what do you need help with?", with: "How do i test?"
    click_button "Ask your Question"
    expect(page).to include?("How do i test?")
  end

end
