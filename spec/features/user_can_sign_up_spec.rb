require 'rails_helper'
require_relative '../helpers/web_helpers'

RSpec.feature "Sign up", type: :feature do
  scenario "Can create an account" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
    expect(page).to have_content("Hello Harry!")
  end
end
