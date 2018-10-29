require 'rails_helper'

RSpec.feature "Post", type: :feature do
  before(:each) do
    successfulSignUp
  end
  
  scenario "Can submit posts and view them" do
    newPostAndSubmit("Hello, world!")
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can add posts with newlines" do
    newPostAndSubmit("Hello\nNewLine here")
    expect(page).to have_content("Hello\nNewLine here")
  end

  scenario "Post has a time stamp" do
    t = Time.now.utc
    time = t.strftime("%H:%M %Y-%m-%d")
    newPostAndSubmit("time stamp")
    expect(page).to have_content("time stamp")
    expect(page).to have_content(time)
  end

  scenario "Posts are shown latest first" do
    newPostAndSubmit("Old Message")
    newPostAndSubmit("New Message")
    expect("New Message").to appear_before("Old Message")
  end

end
