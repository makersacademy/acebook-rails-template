RSpec.feature "Edit/update posts", type: :feature do

  scenario "update link vanishes after 10 mins" do
    sign_up
    visit "/posts"
    click_link "New Post"
    post_creation_time = Time.now - 650
    Timecop.freeze(post_creation_time)
      fill_in "Message", with: "Hello, world!"
      click_button "Submit"
    Timecop.return # "turn off" Timecop
    page.refresh
    expect(page).to_not have_link("Update")
  end
end
