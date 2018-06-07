require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Posts should be displayed in chronological order" do
    visit "/posts"
    fill_in "Message", with: "Yo"
    click_button "Submit"
    fill_in "Message", with: "Bye"
    click_button "Submit"
    expect("Bye").to appear_before("Yo")
  end

  scenario "Post display a timestamp" do
    new_time = Time.local(2016, 6, 1, 12, 0, 0).strftime("%e %B %Y %H:%M")
    Timecop.freeze(new_time)
    visit "/posts"
    fill_in "Message", with: "Yo"
    click_button "Submit"
    expect(page).to have_content("#{new_time}")
  end

  scenario "Doesn't allow empty posts" do
    new_time = Time.local(2015, 5, 1, 12, 0, 0).strftime("%e %B %Y %H:%M")
    Timecop.freeze(new_time)
    visit "/posts"
    click_button "Submit"
    expect(page).not_to have_content("#{new_time}")
  end

  scenario "It deletes a post" do
    visit "/posts"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    fill_in "Message", with: "Yo"
    click_button "Submit"
    first('.item').click_link('Delete')
    expect(page).to have_content("Hello, world!")
    expect(page).not_to have_content("Yo")
  end
end
