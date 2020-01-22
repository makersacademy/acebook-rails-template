RSpec.feature "Friend List", type: :feature do

  let(:user) { create(:user) }

  before do
    sign_up("Example1", "test@example.com", "pass123", "pass123")
    click_link "Sign out"
  end

  scenario "Can add friend from non-friend area" do
    sign_in("#{user.email}", "hey12345")
    expect(page).to have_link("Friend List")
    click_link "Friend List"

    expect(page).to have_current_path "/friendships"
    expect(page).to have_css('div.non-friend')
    expect(page).to have_no_css("div.friend")
    expect(page).to have_content("test@example.com")
    expect(page).to have_link("Add friend")

    click_link "Add friend"

    expect(page).to have_no_css("div.non-friend")
    expect(page).to have_css("div.friend")
  end
end
