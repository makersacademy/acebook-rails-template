require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can sign up and be added to database" do
    visit "/"
    click_link "Sign up"
    fill_in "First name", with: "Test"
    fill_in "Last name", with: "Test"
    fill_in "Pronoun", with: "she"
    fill_in "Email", with: "asd@dsa"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"
    expect(User.all.last.email).to eq('asd@dsa')
    expect(User.all.last.first_name).to eq('Test')
  end
end
