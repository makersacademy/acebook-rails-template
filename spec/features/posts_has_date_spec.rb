require 'rails_helper'
require 'web_helper'

RSpec.feature "Post has dates", type: :feature do
  before do
    Timecop.freeze(Time.local(1990))
  end

  after do
    Timecop.return
  end

  scenario "Each post has a date" do

    user_sign_up
    submit_test_post
    expect(page).to have_content("January 01")
    visit("/posts")
    expect(page).to have_content("January 01")
  end

end
