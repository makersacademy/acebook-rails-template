require 'rails_helper'

RSpec.feature "Sign Up With Github" do
  before :each do
    info = OmniAuth::AuthHash::InfoHash.new(email: "#{ENV['GMAIL_USERNAME']}")
    OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new({
      :provider => 'github',
      :uid => '57436774',
      :info => info
      })
    OmniAuth.config.test_mode = true
  end

  scenario 'user signs up with their Github credentials' do
    visit '/'
    click_link 'Sign in with GitHub'
    expect(page).to have_content "Logged in as #{ENV['GMAIL_USERNAME']}"
  end
end
