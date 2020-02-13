require 'rails_helper'

RSpec.feature "User", type: :feature do
  scenario "Redirected to index when visiting different URL when not signed up" do
    visit "/"
    visit "/posts"
    expect(current_path).to eql("/")
  end

  scenario "Redirected to posts page after sign up" do
    visit "/"
    sign_up
    expect(current_path).to eql("/posts")
  end
end