require 'rails_helper'
require 'timecop'

RSpec.feature "Timeline", type: :feature do
  before do
    sign_in_helper
  end
  context "Creating a new post" do
    scenario "Can submit posts and view them" do
      visit('/')
      create_post("Hello, world!")
      expect(page).to have_content("Hello, world!")
    end

    scenario "Posts have a timestamp" do
      Timecop.freeze(Time.zone.parse('13:00 3 October 2018'))
      create_post("Hello, world!")
      expect(page).to have_content("Wednesday, 3 Oct 2018 at 1:00 PM")
    end

    scenario "Posts appear in reverse chronological order" do
      Timecop.freeze(Time.zone.parse('13:00 3 October 2018'))
      create_post("First Post")
      Timecop.freeze(Time.zone.parse('13:00 4 October 2018'))
      create_post("Second Post")
      expect(first('p.post-message')).to have_content("Second Post")
    end
  end
end
