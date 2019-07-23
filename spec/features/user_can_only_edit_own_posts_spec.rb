require 'rails_helper'
require 'sign_up_helper'
require 'date'

RSpec.feature "Edit posts", type: :feature do
  scenario "Edit button only appears on user's own posts" do
    sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Logout"
    click_link "Sign up"
    fill_in "Email", with: "differentemail@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Submit"
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hi, earth!"
    click_button "Submit"

    first_post = page.find('div.post', text: 'Hello, world')
    second_post = page.find('div.post', text: 'Hi, earth')

    expect(first_post).not_to have_button('Edit')
    expect(second_post).to have_button('Edit')
  end

  scenario "User can't edit posts after 10 minutes" do
    p DateTime.now

    time_11_mins = DateTime.now + (10.0 / (24 * 60))
    allow(DateTime).to receive(:now).and_return(time_11_mins)

    sign_up
    click_link "New post"
    fill_in "Message", with: "Hi, earth!"
    click_button "Submit"
    p time_11_mins
    p DateTime.now

    first_post = page.find('div.post', text: 'Hi, earth!')
    expect(first_post).not_to have_button('Edit')

  end

  scenario "User can edit post" do
    sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hi, earth!"
    click_button "Submit"
    find_button("Edit").click

    expect(page).to have_content("Hi, earth!")

    fill_in "post[message]", with: "Goodbye, planet!"
    click_button "Submit"

    expect(page).to have_current_path('/posts')
    expect(page).not_to have_content("Hi, earth!")
    expect(page).to have_content("Goodbye, planet!")
  end
end
