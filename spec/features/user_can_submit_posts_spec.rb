# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up_successfully
    submit_post_successfully
    
    expect(page).to have_content("Hello, world!")
  end
end
