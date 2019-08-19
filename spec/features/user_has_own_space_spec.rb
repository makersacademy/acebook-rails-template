RSpec.feature "Own Wall", type: :feature do
  scenario "logged in user can see posts on their own wall" do
    sign_up
    url = URI.parse(current_url)
    p url.request_uri
    click_link "New post"
    fill_in "Message", with: "test own wall post"
    click_button "Submit"
    click_button "logout"
    sign_up_second_user
    visit url
    expect(page).to have_content("test own wall post")
  end
end
