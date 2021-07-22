RSpec.feature "User authentication", type: :feature do
  scenario "user can sign in" do
    visit "/"
    click_link "signup"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end