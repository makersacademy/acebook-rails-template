# frozen_string_literal: true

require 'rails_helper'
require_relative '../helpers/custom_helper'


RSpec.describe "Timeline", type: :feature do
  scenario "User wants to delete a post" do
    sign_up
    create_post
    click_link 'Delete Post'
    expect(page).not_to have_content('Hello, world!')
  end
end
