require 'rails_helper'
require_relative '../helpers/features_helper.rb'

RSpec.feature "Timeline", type: :feature do

  before do
    Timecop.freeze(Time.local(1994))
  end
  
  after do
    Timecop.return
  end

  scenario "Can submit posts and view them" do
    sign_up
    sign_in

    fill_in :post_message, with: "Hello, world!"
    find("input[type=submit][value='Submit']").click
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("What's on your mind?")
    expect(page).to have_content("01/01/1994 0:00")
  end
end
