require 'rails_helper'

RSpec.feature "Delete", type: :feature do
  scenario "Can delete specific posts" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password123')
    new_post('First post')

    post_id = Post.first.id
    
    within("div##{post_id}") do
      click_link "Update"
    end
    
    expect(page.current_path).to eq("/posts/update##{post_id}")

    click_on "Edit"
    fill_in "Post", with: "Updated first post"
    click_on "Submit"

    visit '/posts'

    expect(page).to have_content("Updated first post")
  end
end