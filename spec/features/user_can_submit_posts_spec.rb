require 'rails_helper'

RSpec.feature "Post", type: :feature do
  scenario "Can submit posts and view them" do
    postAndClick
    fillPostAndSubmit("Hello, world!")
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can add posts with newlines" do
    postAndClick
    fillPostAndSubmit("Hello\nNewLine here")
    expect(page).to have_content("Hello\nNewLine here")
  end

  scenario "Post has a time stamp" do
    t = Time.now.utc
    time = t.strftime("%H:%M %Y-%m-%d")
    postAndClick
    fillPostAndSubmit("time stamp")
    expect(page).to have_content("time stamp")
    expect(page).to have_content(time)
  end

end
