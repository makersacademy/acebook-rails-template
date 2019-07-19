require 'rails_helper'

RSpec.feature "Edit posts", type: :feature do
  scenario "Edit button only appears on user's own posts" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "testemail@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Logout"
    click_link "Sign up"
    fill_in "Email", with: "differentemail@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hi, earth!"
    click_button "Submit"
    first_post = page.find('div.post', text: 'Hello, world')
    second_post = page.find('div.post', text: 'Hi, earth')
    expect(first_post).not_to have_css('.edit')
    expect(second_post).to have_css('.edit')
  end
end
