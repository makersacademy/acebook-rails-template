require 'rails_helper'

RSpec.feature "Liking", type: :feature do

  before(:each) do
    sign_up
    add_post
  end

  scenario "Can like post from show page and view immediately" do
    click_link "Hello, world!"
    click_button 'Like'
    expect(page).to have_button("New Comment")
    expect(page).to have_content("1")
  end

  scenario "Can like post from index page and view immediately" do
    within(find("div#post_0")) do
      click_button 'Like'
    end
    expect(current_path).to eq '/posts'
    expect(find("div#post_0")).to have_content("1")
  end

end
