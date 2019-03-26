require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario "Can sign up" do
    visit "/signup"
    fill_in "username", with: "Foo"
    fill_in "password", with: "Bar"
    fill_in "email", with: "Foo@Bar.com"
    click_button "Submit"
    expect(User.exist?(username: "Foo")).to be true
  end
end
