require 'rails_helper'

RSpec.feature "Profile picture", type: :feature do
  scenario 'user can have the default profile picture' do
    sign_up_nellie_nopicture
    click_on("Nellie Nopicture")
    expect(page.html).to include("defaultprofile")
  end

  scenario 'user can replace the default profile picture' do
    login_george_manyposts
    click_link("New post")
    fill_in "post_message", with: "This post has a picture attached!"
    page.attach_file("post_image", 'spec/fixtures/imagename.jpg')
    click_on "Submit"
    click_link('George Manyposts', match: :first)
    expect(page.html).to include("imagename")
  end
end
