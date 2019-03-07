require 'rails_helper'

RSpec.describe "Album features" do
  scenario "creates a new album the first time a user uploads an image" do
    login_george_manyposts
    click_link("New post")
    fill_in "post_message", with: "This post goes into an album"
    page.attach_file("post_image", 'spec/fixtures/imagename.jpg')
    click_on "Submit"
    expect(Album.find_by(user_id: 1).title).to eq "George's Photos"
  end

end