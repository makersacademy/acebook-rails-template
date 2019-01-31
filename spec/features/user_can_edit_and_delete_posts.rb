require 'rails_helper'
require 'web_helpers'

RSpec.feature "Timeline", type: :feature do

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.new(id: 1))
  end

  scenario "Can delete a post" do
    submit_post
    click_link "Hello, world!"
    click_link "Delete"
    expect(page).not_to have_content("Hello, world!")
  end

  scenario "Can edit a post" do
    submit_post
    click_link "Hello, world!"
    click_link "Edit"
    fill_in "Message", with: "Have a wonderful day!"
    click_button "Submit"
    expect(page).to have_content("Have a wonderful day!")
  end

end
