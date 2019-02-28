require 'rails_helper'

RSpec.feature "Can post an image and view it", type: :feature do
  scenario "A post can have newlines in it, and this will be reflected in the output" do
    visit '/'
    click_link("Sign up", match: :first)
    fill_in "user_email", with: "featureimage@email.com"
    fill_in "user_first_name", with: 'image'
    fill_in "user_last_name", with: 'test'
    fill_in "user_password", with: "featurepwd"
    fill_in 'user_password_confirmation', with: "featurepwd"
    click_on "Submit"
    click_link("New post")
    fill_in "post_message", with: "This post has a picture attached!"
    page.attach_file("post_image", Rails.root + 'app/assets/images/imagename.jpg')
    click_on "Submit"
    expect(page.html).to include("imagename.jpg")
    expect(page.html).to include("This post has a picture attached!")
  end
end
