require 'rails_helper'
require 'timecop'

RSpec.feature "Timeline", type: :feature do
  context "Creating a new post" do
    scenario "Can submit posts and view them" do
      create_post
      expect(page).to have_content("Hello, world!")
    end

    scenario "Posts have a timestamp" do
      Timecop.freeze(Time.zone.parse('13:00 3 October 2018'))
      create_post
      expect(page).to have_content("Wednesday, 3 Oct 2018 at 1:00 PM")
    end
  end
end
