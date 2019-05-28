require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    first_name = 'Bob'
    last_name = 'Geldof'
    email = 'its.me@bobgeldof.com'
    password = 'bob123'

    visit "/users/new"
    fill_in('user[first_name]', with: first_name)
    fill_in('user[last_name]', with: last_name)
    fill_in('user[email]', with: email)
    fill_in('user[password]', with: password)
    click_button('Signup')
    expect(page).to have_selector("input[type=submit][value='Log in']")
    fill_in('session[email]', with: email)
    fill_in('session[password]', with: password)
    click_button('Log in')
    click_link "New post"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
