RSpec.feature "Post order", type: :feature do
  scenario "Posts should be shown in a reverse chronological order" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "First post"
    click_button "Submit"

    sleep(1.2)

    click_link "New post"
    fill_in "Message", with: "Second post"
    click_button "Submit"

    expect(page.body.index('First post')).to be > page.body.index('Second post')
  end
end
