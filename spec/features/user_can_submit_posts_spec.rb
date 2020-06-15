require 'rails_helper'
require_relative '../support/feature_web_helpers'
require_relative '../support/capybara_selectors'


RSpec.feature "User posts", type: :feature do
  scenario "User can sign up, submit a post" do
    visit "/"
    fill_in_signup_form_and_submit
    post_hello_world_message
    expect(page).to have_content("Hello, world!")
  end

  scenario "User unable to post and unless signed in" do
    visit "/posts"
    expect(page).not_to have_content("New Post")
  end

  scenario "User tries to hack into new post and gets redirected to login" do
    visit "/posts/new"
    expect(current_path).to eq "/login"
  end
end
