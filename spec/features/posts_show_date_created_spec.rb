require 'rails_helper'
require 'helpers/create_post'

RSpec.feature "Timeline", type: :feature do
  before do
    now = Time.zone.parse("Apr 17, 2018, 12:00PM")
    Timecop.freeze(now)
  end
  scenario "Posts can have multiple lines" do
    create_post
    expect(Time.zone.now).to have_content("2018-04-17 12:00:00 UTC")
  end
end
