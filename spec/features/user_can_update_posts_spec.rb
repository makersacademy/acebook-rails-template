require 'rails_helper'
require 'timecop'
require_relative './method_helpers'

RSpec.feature "Timeline", type: :feature do
  scenario "can update posts" do
    create_post
    update_post
    expect(page).to have_content("Bye")
  end
  scenario "cannot update a post after ten minutes" do
    create_post
    t = Time.now
    Timecop.freeze(t + 10) do
      update_post
      expect(page).to have_content("Error")
    end
  end
end
