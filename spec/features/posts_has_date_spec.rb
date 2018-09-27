require 'rails_helper'
require 'web_helper'

RSpec.feature "Post has dates", type: :feature do
  scenario "Each post has a date" do
    user_sign_up
    submit_test_post
    visit("/posts")
    expect(page).not_to have_content("September 27")
  end

end
