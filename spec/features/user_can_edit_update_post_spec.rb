require 'rails_helper'

feature "Update Post" do
  scenario "Can update an existing post written by the user" do
    sign_up
    make_post
    click_link "Edit"
    expect(page).to have_content("Hello, world!")
    fill_in "post[message]", with: "Goodbye, world!"
    click_button "Update Post"
    expect(page).to have_current_path('/')
    expect(page).to have_content("Goodbye, world!")
    expect(page).to have_content("Edited")
  end

  scenario "Cannot edit if a different user made post" do
    sign_up
    make_post
    click_link "Log out"
    sign_up_as_potato
    expect(page).to have_content("Hello, world!")
    expect(page).not_to have_content("Edit")
  end

  scenario "cannot edit messages after 10 minutes have passed" do
    sign_up
    make_post
    allow(Time).to receive(:now).and_return(Time.now + 601)
    click_link "Edit"
#  expect(msg).to eq("Can't edit: Post is older than 10 minutes")
#     msg.accept
    expect(page).to have_current_path("/")
  end
end