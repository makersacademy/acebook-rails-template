RSpec.describe "Timeline", type: :feature do
  scenario "User wants to like a post" do
    sign_up
    create_post
    my_link = find(:xpath, "//a[contains(@href,'/like')]")
    my_link.click
    expect(page).to have_content("1")
  end
end
