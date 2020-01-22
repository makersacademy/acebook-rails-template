require 'rails_helper'

RSpec.feature "Update", type: :feature do
  before(:each) do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
  end

  scenario "Can update a comment" do
    new_post('First post')
    new_comment('Test comment')

    within('.comment') do
      click_link "Edit"
    end

    fill_in "comment[message]", with: "Updated comment"
    click_on "Update Comment"

    expect(page).to have_content("Updated comment")
  end

  scenario "shows error if don't fill in comment field" do
    new_post('First post')
    new_comment('Test comment')

    within('.comment') do
      click_link "Edit"
    end

    fill_in "comment[message]", with: ""
    click_on "Update Comment"

    expect(page).to have_content "Message can't be blank"
  end

  scenario "Cannot update a post after 10 minutes" do
    new_post('First post')

    comment_time = Time.local(2020, 1, 1, 0, 0, 0)
    Timecop.freeze(comment_time)
    new_comment('Test comment')

    edit_time = Time.local(2020, 1, 1, 0, 10, 0)
    Timecop.freeze(edit_time)

    within('.comment') do
      click_link "Edit"
    end

    expect(page).to have_content('You can only edit the comment for 10 minutes after posting')
    expect(page.current_path).to eq('/posts')

    Timecop.return
  end

  scenario "User receives an error message when they try to update another users comment" do
    new_post('First post')
    new_comment('Test comment')

    click_on 'Sign out'

    sign_up('Andrea', 'Diotallevi', 'andrea@example.co.uk', 'password')

    within('.comment') do
      click_link "Edit"
    end

    expect(page).to have_content('You can only edit your own comments')
    expect(page.current_path).to eq('/posts')
  end
end
