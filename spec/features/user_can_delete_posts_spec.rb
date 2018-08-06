require 'rails_helper'

RSpec.feature "Delete Posts", type: :feature do

  before(:each) do
    successful_sign_up
    first_user_post
  end

  scenario "A user can delete post from the user homepage" do
    click_link("Delete", :match => :first)
    click_button("OK")
    expect(page).not_to have_text('test_first_name My first post less than a minute')
  end

  # scenario "Posts display in reverse chronological order" do
  #   successful_sign_up_second_user
  #   second_user_post
  #   expect(page).to have_text('test_first_name2 Second user post less than a minute test_first_name My first post less than a minute')
  # end

end
