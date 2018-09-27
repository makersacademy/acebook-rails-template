require 'rails_helper'
require 'web_helper'

RSpec.feature "Post has dates", type: :feature do
  scenario "Each post has a date" do
    user_sign_up
    submit_test_post
    expect(page).to have_content("September 27")
    visit("/posts")
    expect(page).to have_content("September 27")
  end

end
