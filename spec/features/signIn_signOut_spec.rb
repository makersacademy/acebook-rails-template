require_relative "../web_helpers"
require 'rails_helper'

describe "Sign In" do

  before do
    visit_site_sign_up
    sign_out
  end

  context "correct sign in credentials" do

    before do
      sign_in_to_test
    end

    it "signs the user in with correct credentials" do
      visit '/'
      expect(page).to have_content("Welcome username123")
    end

    it "redirects to users timeline after signing in" do
      expect(page).to have_content("username123's wall")
    end

    it "signs the user out" do
      sign_out
      expect(page).to have_content("Sign Up")
    end

  end

  it "does not sign in the user if credentials are incorrect" do
    sign_in_to_test(wrong_credentials = true)
    expect(page).to have_content ("Forgot your password")
  end
end
