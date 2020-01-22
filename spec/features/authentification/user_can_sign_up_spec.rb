require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can create an account" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
    expect(page).to have_content("Hello Harry!")
  end
end
