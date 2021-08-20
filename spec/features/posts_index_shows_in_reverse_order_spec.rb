require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "posts are viewed in reverse order" do
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    visit "/posts/new"
    fill_in "Message", with: "Hello, again!"
    click_button "Submit"
    expect(current_path).to eq '/posts'
    expect(page.find('p:nth-child(4)')).to have_content "Hello, again!"
    expect(page.find('p:nth-child(5)')).to have_content "Hello, world!"
  end
end
