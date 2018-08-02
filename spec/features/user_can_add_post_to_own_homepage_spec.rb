require 'rails_helper'

RSpec.feature "User homepage", type: :feature do

  before(:each) do
    successful_sign_up
    @time1 = Timecop.freeze('2018-01-01 01:00:00 +0100')
    @time2 = Timecop.freeze('2018-01-01 02:00:00 +0100')
  end

  scenario "A user can add a post to their own homepage" do
    successful_log_in
    fill_in :post, with: "My first post"
    click_button "Post"
    fill_in :post, with: "My second post"
    click_button "Post"
    # syntax below should allow us to check that a few different strings
    # are displayed in the correct order
    expect(page).to have_text(/'test_first_name' .+ 'My second post' .+ 'created at #{@time2}' .+ 'test_first_name' .+ 'My first post' .+ 'created at #{@time1}'/)
  end

end
