require 'rails_helper'

RSpec.feature "GitHub sign in", type: :feature do

  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
  end

  scenario "User can sign in via GitHub" do
    visit '/'
    expect(page).to have_content("Sign in with GitHub")
    click_link "Sign in with GitHub"

    expect(page).to have_content("Account: test@example.com")
    expect(page).to have_content("Sign out")

    OmniAuth.config.mock_auth[:github] = nil
  end

end
