require 'rails_helper'
require 'web_helper'

RSpec.feature "Like a post", type: :feature do
  scenario "user can like a post" do
    sign_up
    expect {
      page.find('#posts li:first-child').click_button('Like')
    }.to change { Like.count }.by(1)
  end
end
