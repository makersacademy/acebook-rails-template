require 'rails_helper'

RSpec.feature "Edit post", type: :feature do

  let(:user) { create(:user) }
  let(:recipient) { create(:user, email: "test@example.com", password: "test1234", :id => 2) }
  let(:postA) { create(:post, user_id: user.id, recipient_id: recipient.id, message: "Hello, world!") }

  before do
    sign_in("#{user.email}", "hey12345")
    post("Hello, world!")
    @post_time = Time.now
  end

  scenario "Can edit a post if it belongs to the user" do

    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Date posted: #{@post_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by #{user.email}")
    expect(page).to have_link('Edit')
    expect(page).to have_current_path("/#{user.id}")

    click_link 'Edit'
    fill_in "Message", with: "Goodbye, world!"
    click_button "Update Post"

    expect(page).to have_content("Goodbye, world!")
    expect(page).to have_content("Date posted: #{@post_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by #{user.email}")
    expect(page).to have_current_path("/#{user.id}")
  end

  scenario "Cannot edit post if it does not belong to the user" do

    expect(page).to have_content("Hello, world!")
    expect(page).to have_link('Edit')

    click_link "Sign out"
    sign_up("test2@example.com", "test1234", "test1234")

    visit "/#{user.id}"

    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Date posted: #{@post_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by #{user.email}")
    expect(page).not_to have_link "Edit"
  end

  scenario "Cannot edit post via /posts/:id/edit, if it does not belong to the user" do

    click_link "Sign out"
    sign_in("#{recipient.email}", "test1234")

    visit "/posts/#{postA.id}/edit"

    expect(page).to have_content "That post doesn't belong to you"
  end
end
