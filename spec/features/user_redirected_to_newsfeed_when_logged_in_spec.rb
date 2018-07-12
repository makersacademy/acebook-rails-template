# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "User redirected to newsfeed on login", type: :feature do
  scenario "successfuly" do
    sign_up_successfully

    expect(page).to have_content("What's on your mind?")
  end
end
