require 'rails_helper'
include Warden::Test::Helpers


RSpec.feature "User authentication", type: :feature do
  scenario "user can sign up" do
    user_sign_up
    expect(page).to have_content("CatBook")
  end
end

# f.email_field :email