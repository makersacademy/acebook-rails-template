require 'rails_helper'

RSpec.feature "Auto links", type: :feature do

  before(:each) do
    sign_up
  end

  scenario "Link exists in posts" do
    link_url = "https://github.com/vmg/rinku"
    add_post(link_url)
    expect(find("div#post_0")).to have_link(link_url)
  end

  scenario "Link exists in comments" do
    link_url = "https://github.com/vmg/rinku"
    add_post
    click_link "View Comments"
    fill_in "comment[content]", with: link_url
    click_button "Create Comment"
    expect(find("div#comment_0")).to have_link(link_url)
  end

end
