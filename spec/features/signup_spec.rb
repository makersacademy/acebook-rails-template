require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario "Can sign up" do
    visit "/signup"
    fill_in 'signup[username]', with: "Foo"
    fill_in 'signup[password]', with: "Bar"
    fill_in 'signup[email]', with: "Foo@Bar.com"
    click_button "Submit"
    expect(Signup.exists?(username: "Foo")).to be true
  end
end
