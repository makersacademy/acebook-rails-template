require 'rails_helper'
require 'login_signup_helper'

RSpec.feature "Profile picture", type: :feature do
  scenario 'user can upload profile picture on sign up' do
    sign_up_wendy_withpicture
    click_on("Edit profile")
    expect(page).to have_content("Edit User")
    page.attach_file("post_image", 'spec/fixtures/imagename.jpg')
    click_on("Update")
    click_on("wendy.withpicture@gmail.com")
    expect(page.html).to include("imagename.jpg")
  end

end
