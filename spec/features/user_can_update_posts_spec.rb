require 'rails_helper'
require 'timecop'
require_relative './method_helpers'
require_relative './sign_up_helper'

RSpec.feature "Timeline", type: :feature do

  scenario "can update posts" do
    registration
    create_post
    update_post
    expect(page).to have_content("Bye")
  end

  scenario "cannot update a post after ten minutes" do
    registration
    create_post
    t = Time.now
    Timecop.freeze(t + 9) do
      expect(page).to have_selector(:link_or_button, "Edit")
    end
  end

  scenario "cannot update a post after ten minutes" do
    registration
    create_post
    t = Time.now
    Timecop.freeze(t + 601) do
      visit current_path
      expect(page).not_to have_selector(:link_or_button, "Edit")
    end
  end
end
