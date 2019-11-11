require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    log_in_test_user
    user = User.first
    submit_post("Hello, world!")
    expect(current_path).to eq "/#{user.id}"
    expect(page).to have_content("Hello, world!")
  end
end

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts on another users wall and stay on same wall" do
    @user = FactoryBot.create(:user)
    log_in_test_user
    visit "/#{@user.id}"
    submit_post("Hello, world!")
    expect(current_path).to eq "/#{@user.id}"
    expect(page).to have_content("Hello, world!")
  end
end

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts on another users wall and not see the post on own wall" do
    @user = FactoryBot.create(:user)
    log_in_test_user
    user_2 = User.last
    visit "/#{@user.id}"
    submit_post("Hello, world!")
    visit "/#{user_2.id}"
    expect(page).not_to have_content("Hello, world!")
  end
end
