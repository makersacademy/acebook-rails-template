# require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario "sign in page has sign up button" do
    visit '/'
    expect(page).to have_button('sign up')
  end
end
