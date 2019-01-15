require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  before :each do
    # createUser()
    signin()
    postMessage()
  end


  scenario "Can leave a comment on a post and view them" do
    first('.comment').click
    fill_in "comment_content", with: "Test comment"
    click_button "Submit"
    expect(page).to have_content "Test comment"
  end

  scenario "Can edit a comment" do
    addFriend()
    first('.comment').click
    fill_in "comment_content", with: "Test comment"
    click_button "Submit"
    all('a', :text => 'Edit')[1].click
    fill_in "comment_content", with: "Changed comment"
    click_button "Submit"
    expect(page).to have_content "Changed comment"
  end

  scenario "Can delete a comment" do
    addFriend()
    save_and_open_page
    all('a', :text => 'Delete')[0].click
    expect(page).not_to have_content "this_is_a_new_comment"
  end

  scenario "Can't edit/delete someone else's comments" do
    signout()
    createUser(email: "new@test.com")
    signin(email: "new@test.com", password: "hello2")
    expect(page).not_to have_content "Edit"
    expect(page).not_to have_content "Delete"
  end

end
