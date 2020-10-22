require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  before do
    Timecop.freeze(Time.local(1994))
  end
  
  after do
    Timecop.return
  end

  scenario "Can submit posts and view them" do
    visit "/posts"
    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("01/01/1994 0:00")
  end
end
