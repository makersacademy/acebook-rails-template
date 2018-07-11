require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  before do
    now = Time.zone.parse("Apr 17, 2018, 12:00PM")
    Timecop.freeze(now)
  end
  scenario "Posts can have multiple lines" do
    user = User.create(id: 1, name: 'matt', email:'mdwareing@gmail.com', password: 'test12345')
    visit '/'
    click_link 'Log In'
    fill_in "Email", with: "mdwareing@gmail.com"
    fill_in "Password", with: "test12345"
    click_button "Log in"
    visit new_user_post_path(user)
    fill_in "Message", with: "Hello, world!\n This is a post with multiple \n lines"
    click_button "Submit"
    expect(Time.zone.now).to have_content("2018-04-17 12:00:00 UTC")
  end
end
