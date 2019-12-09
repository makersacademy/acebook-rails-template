require 'rails_helper'

RSpec.feature "Post", type: :feature do
  scenario "Can submit posts and view them" do
<<<<<<< HEAD
    visit "/"
    fill_in "post_username", with: "Alistair Phipps"
    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Alistair Phipps")
=======
    sign_up_user
    make_post
>>>>>>> 8250293df34bd888b32b8a587f89f0415bc08534

    expect(page).to have_css("ul", text: "Beep beep")
    expect(page).to have_css("ul", text: "Robot")
  end

  scenario "Posts are displayed in the correct order" do
    sign_up_user
    make_post

    fill_in "Message", with: "A later beep beep"
    click_button "Submit"

    expect("A later beep beep").to appear_before("Beep beep")
  end
end
