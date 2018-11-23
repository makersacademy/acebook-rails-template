require 'rails_helper'
require 'time'
require_relative '../web_helpers.rb'

RSpec.feature "Timeline", type: :feature do
  scenario "Displays time of post" do
    visit_site_sign_up
    hello_world_post
    time = Post.last.created_at.to_s
    formatted_time = Time.parse(time).strftime('%-d %b %Y at %k:%M')
    expect(page).to have_content "Hello, world!"
    expect(page).to have_content formatted_time
  end
end
