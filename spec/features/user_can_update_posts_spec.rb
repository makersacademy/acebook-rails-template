require 'rails_helper'

RSpec.feature "Update", type: :feature do
  before(:each) do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
  end

  scenario "Can update a post" do
    new_post('First post')
    
    within(first('.post')) do
      click_link "Edit"
    end

    fill_in "Message", with: "Updated first post"
    click_on "Submit"

    visit '/posts'

    expect(page).to have_content("Updated first post")
  end

  scenario "Cannot update a post after 10 minutes" do
    post_time = Time.local(2020, 1, 1, 0, 0, 0)
    Timecop.freeze(post_time)

    new_post('First post')

    edit_time = Time.local(2020, 1, 1, 0, 10, 0)
    Timecop.freeze(edit_time)

    within(first('.post')) do
      click_link "Edit"
    end

    expect(page).to have_content('You can only edit the post for 10 minutes after posting')
    expect(page.current_path).to eq('/posts')

    Timecop.return
  end

  scenario "User receives an error message when they try to update another users post" do
    new_post('First post')

    click_on 'Sign out'

    sign_up('Andrea', 'Diotallevi', 'andrea@example.co.uk', 'password')

    within(first('.post')) do
      click_link "Edit"
    end

    expect(page).to have_content('You can only edit your own posts')
    expect(page.current_path).to eq('/posts')
  end
end
