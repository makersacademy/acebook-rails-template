require 'rails_helper'

RSpec.feature "Image post", type: :feature do
  scenario "A post can have an image in it and show it" do
    login_george_manyposts
    fill_in "post_message", with: "This post has a picture attached!"
    page.attach_file("post_image", 'spec/fixtures/imagename.jpg')
    click_on "Submit"
    expect(page.html).to include("imagename.jpg")
    expect(page.html).to include("This post has a picture attached!")
  end

  scenario "A post can have a post and not show an image" do
    login_george_manyposts
    fill_in "post_message", with: "This post has no picture attached!"
    click_on "Submit"
    expect(page.html).not_to include(".jpg")
    expect(page.html).to include("This post has no picture attached!")
  end
end
