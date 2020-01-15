require 'rails_helper'
require_relative '../helpers/web_helpers'

RSpec.feature "Sign up", type: :feature do
  scenario "Can create an account" do
    sign_up
    expect(page).to have_content("Hello David!")
  end
end
