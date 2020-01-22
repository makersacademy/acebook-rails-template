require 'rails_helper'

RSpec.feature "Delete comment", type: :feature do

  let(:user) { create(:user) }

  before do
    sign_in("#{user.email}", "hey12345")
    post("Hello, world!")
    click_on "Comment"
    fill_in "Message", with: "You think the depths will harbour you JON?"
    @comment_time = Time.now
    click_button "Submit"
  end

  scenario "Can delete a comment if it belongs to the user" do

    expect(page).to have_content("You think the depths will harbour you JON?")
    expect(page).to have_content("Date: #{@comment_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by #{user.email}")
    expect(page).to have_link('Delete')

    within(".comment") { click_link('Delete') }

    expect(page).to have_content("Comment vapourised.")
    expect(page).not_to have_content("You think the depths will harbour you JON?")
    expect(page).not_to have_content("Date: #{@comment_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).not_to have_content("Posted by email@example.com")
    expect(page).to have_current_path "/#{user.id}"
  end

  scenario "Cannot delete a comment if it does not belong to the user" do

    click_link "Sign out"
    sign_up("Example1", "test2@example.com", "test1234", "test1234")

    visit "/#{user.id}"

    expect(page).to have_content("You think the depths will harbour you JON?")
    expect(page).to have_content("Date: #{@comment_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by #{user.email}")
    within(".comment") { expect(page).not_to have_link "Delete" }
  end
end
