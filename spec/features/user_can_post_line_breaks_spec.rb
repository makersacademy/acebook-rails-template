# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Post", type: :feature do
  before(:each) do
    Capybara.current_driver = :selenium
  end

  scenario "Can submit posts with line breaks" do
    sign_up_user
    fill_in "post_message", with: "Hello\n world!"
    click_button "Submit"
    expect(page.html).to match(/Hello\s*<br>\s*world!/)
  end

  after(:all) do
    Capybara.use_default_driver
  end
end
