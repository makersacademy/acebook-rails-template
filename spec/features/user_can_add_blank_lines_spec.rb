require 'rails_helper'
require './spec/features/web_helper'

RSpec.feature "Timeline", type: :feature do

  scenario "Can have a new line" do
    create_user
    click_link "New post"
    fill_in "Message", with: "Hello, world!\nAlso, good morning."
    click_button "Post"
    expect(page).to have_content("Hello, world!\nAlso, good morning.")
  end


end
