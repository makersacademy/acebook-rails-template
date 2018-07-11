require 'rails_helper'

RSpec.feature "Timeline" do
  scenario "Posts can be liked" do
    user = User.create(id: 1, name: 'matt', email:'mdwareing@gmail.com', password: 'test12345')
    post = Post.create(id: 1, message: "Hello, world!", user_id: 1)
    visit '/'
    click_link 'Log In'
    fill_in "Email", with: "mdwareing@gmail.com"
    fill_in "Password", with: "test12345"
    click_button "Log in"
    find(:xpath, "//a[contains(@href,'/users/1/posts/1/likes')]").click
    expect(page).to have_content('1')
  end
end
