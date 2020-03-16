require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  scenario "Can submit posts and view them with the time they were posted at." do
    visit("/posts") # all pages redirect to sign_in b/c user isn't signed up
    sign_up("test@example.com", "example")
    create_post("Hello, world!")
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content(DateTime.now.strftime('%e %B at %H:%M'))
  end

  scenario "Posts appear in reverse chronological order" do
    visit("/posts") # all pages redirect to sign_in b/c user isn't signed up
    sign_up("test@example.com", "example")
    create_post("Last")
    create_post("Middle")
    create_post("First")
    expect("First").to appear_before("Middle")
    expect("Middle").to appear_before("Last")
  end

end
