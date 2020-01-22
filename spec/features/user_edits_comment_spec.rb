require 'rails_helper'

RSpec.feature "Edit comment", type: :feature do

  let(:user) { create(:user) }

  before do
    sign_in("#{user.email}", "hey12345")
    post("Hello, world!")
    click_on "Comment"
    fill_in "Message", with: "You think the depths will harbour you JON?"
    @comment_time = Time.now
    click_button "Submit"
  end

  scenario "Can edit a comment if it belongs to the user" do
    expect(page).to have_content("You think the depths will harbour you JON?")

    within(".comment") { click_on('Edit') }
    fill_in "Message", with: "How poetic!"
    click_on "Update Comment"

    within(".comment") do
      expect(page).to have_content("How poetic!")
      expect(page).to have_content("Date: #{@comment_time.strftime('%d %B %Y at %l:%M %p')}")
      expect(page).to have_content("Posted by #{user.email}")
    end

    expect(page).to have_content("Comment updated. Gnarly!")
    expect(page).to have_current_path("/#{user.id}")
  end

  scenario "Cannot edit post if it does not belong to the user" do

    click_link "Sign out"
    sign_up("Example1", "test2@example.com", "test1234", "test1234")

    visit "/#{user.id}"

    expect(page).to have_content("Hello, world!")

    within(".comment") do
      expect(page).to have_content("You think the depths will harbour you JON?")
      expect(page).to have_content("Date: #{@comment_time.strftime('%d %B %Y at %l:%M %p')}")
      expect(page).to have_content("Posted by #{user.email}")
      expect(page).not_to have_link "Edit"
    end
  end

  scenario "it should block edit if expired time over 10mins" do

    Timecop.freeze(Time.now + 610)
    within(".comment") { click_link "Edit" }

    expect(page).to have_content "Timed out - you cannot edit this comment"
    expect(page).to have_content "You think the depths will harbour you JON?"

    Timecop.return
  end
end
