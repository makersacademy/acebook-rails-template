require 'rails_helper'
require 'timecop'

RSpec.feature "Timeline", type: :feature do

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.new(id: 1))
  end

  scenario "Can edit a post" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    Timecop.freeze(Time.now + 900)
    click_link "Hello, world!"
    expect(page).not_to have_content("Edit")
  end

end
