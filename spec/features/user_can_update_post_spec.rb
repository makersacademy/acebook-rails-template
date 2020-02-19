require 'rails_helper'
require 'web_helpers'

RSpec.feature "Timeline", type: :feature do
  let(:user) { create(:user) }
  let(:user1) { create(:user) }
  let(:post) { create(:post) }
  
  scenario "Can view update button" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    expect(page).to have_button("Update")
  end
  
  scenario "Can update post" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link 'Update'
    fill_in "Message", with: "Hello, Acebook Insane!"
    click_button 'Save Post'

    expect(page).to have_content("Hello, Acebook Insane!")
    expect(page).to have_content(Time.zone.now.strftime("%Y/%m/%d %H:%M:%S").to_s)
  end

  scenario "Can’t update someone else’s post" do
    post
    visit "/"
    click_button("Login")
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button("Login")
    click_link("See All Posts")
    click_link("Update")
    expect(page).to have_content("This is not your post to update")
  end

  scenario "Can't update posts after ten minutes" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    time = Time.utc(2020, 02, 18, 17, 27, 20)
    Timecop.travel(time)
    click_button "Submit"
    new_time = Time.utc(2020, 02, 18, 17, 40)
    Timecop.travel(new_time)
    visit '/posts'
    expect(page).not_to have_link "Update"
    Timecop.return
  end

  

end
