require 'rails_helper'

RSpec.feature "Update", type: :feature do
  scenario "Can update a post" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')

    new_post('First post')

    p Post.all
    post_id = Post.first.id
    
    within("div##{post_id}") do
      click_link "Edit"
    end
    
    expect(page.current_path).to eq("/posts/#{post_id}/edit")

    fill_in "Message", with: "Updated first post"
    click_on "Submit"

    visit '/posts'

    expect(page).to have_content("Updated first post")
  end
end
