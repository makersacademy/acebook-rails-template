require 'rails_helper'
require 'simple_send_keys'

RSpec.feature "Timeline", type: :feature, js: true do
  scenario "Can submit posts and view them" do
    visit "/posts"
    fill_in_form("Hello world!")
    expect(page).to have_content("Hello world!")
  end

  scenario "Can see the newest post first" do
    visit "/posts"
    fill_in_form("Hello World")
    fill_in_form("Good morning")
    expect(page_content).to have_content("Good morning")
  end

  scenario "Can see the post with date and time" do
    post = Post.create(message: "Hello")
    time = post[:created_at].strftime("%B %d %Y, %l:%M%P")
    visit "/posts"
    expect(page_content).to have_content("#{time}")
  end

  scenario "Can submit a multi-line post and view it" do
    visit "/posts"
    click_link "New post"
    find_field('post_message').send_keys('[This, enter, is, enter, a, enter, multi-line, enter, post]')
    click_button "Submit"
    expect(page.html).to include("<p>This\n<br>is\n<br>a\n<br>multi-line\n<br>post")
  end
end
