require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
    create_new_post("Hello, world!")
    expect(page).to have_content("Hello, world!")
  end

  scenario "Post displays the time and date created" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
    create_new_post("Hello, world!")
    expect(page).to have_content(DateTime.now.strftime("%H:%M %a %e %b %Y"))
  end


end
