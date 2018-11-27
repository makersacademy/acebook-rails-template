require 'rails_helper'
require_relative '../web_helpers.rb'

describe "Other timelines" do
  it "can view other users timelines when logged in" do
    visit_site_sign_up
    url = current_url.split('/')
    id = url[3]
    visit '/'
    sign_out
    sign_up_other_user
    visit "/#{id}/user"

    expect(page).to have_content("user@user.com's timeline")
  end
end
