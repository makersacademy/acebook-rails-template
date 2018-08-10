require 'rails_helper'

RSpec.feature "See which users have liked", type: :feature do

  before(:each) do
    @user1 = User.create(first_name: "test_first_name", last_name: "test_last_name", email: "test_email@keepingitrails.com", password: "pa55w0rd")
    @user2 = User.create(first_name: "test_second_name", last_name: "test_last_name", email: "test_email2@keepingitrails.com", password: "pa55w0rd")
    @post = Post.create(user_id: @user1.id, message: "Test message")
  end

  scenario "A user can see his/her like on own post" do
    successful_sign_in
    click_link "Like"
    click_link "Likes"
    expect(page).to have_text("test_first_name")
  end

  context "One user has liked the post" do
    scenario "A user can see which users have liked that post" do
      successful_sign_in
      click_link "Like"
      click_link 'Log Out'
      successful_sign_in_second_user
      click_link "Likes"
      expect(page).to have_content("test_first_name")
    end
  end

  context "More than one users have liked the post" do
    scenario "A user can see which users have liked that post" do
      successful_sign_in
      click_link "Like"
      click_link 'Log Out'
      successful_sign_in_second_user
      click_link "Like"
      click_link "Likes"
      expect(page).to have_content("test_second_name test_first_name")
    end
  end
end
