require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can update posts they have created" do
    signup
    expect(current_path).to eq("/#{my_user_id('ben@example.com')}")
    visit("/posts/new")
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(current_path).to eq("/posts")
    click_on "Edit"
    fill_in "Message", with: "Updated message"
    click_button "Submit"
    expect(page).to have_content("Updated message")
  end

  scenario "Cannot update posts they did not create" do
    signup
    expect(current_path).to eq("/#{my_user_id('ben@example.com')}")
    visit("/posts/new")
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(current_path).to eq("/posts")
    expect(page).to have_button("Edit")
    click_on "Logout"
    signup_user("Dawid", "Dawid@example.com", "password1")
    expect(current_path).to eq("/#{my_user_id('Dawid@example.com')}")
    expect(page).to_not have_content("Edit")
  end
end

RSpec.feature "Timeline", type: :feature do
  before do
    Timecop.freeze(Time.now)
  end

  after do
    Timecop.return
  end
  scenario "Cannot update posts after 10 minutes" do
    signup
    expect(current_path).to eq("/" + my_user_id('ben@example.com'))
    click_on "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(current_path).to eq("/posts")
    Timecop.travel(601)
    click_on "Edit"
    expect(current_path).to eq("/posts")
  end
end
