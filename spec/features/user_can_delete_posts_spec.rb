require 'rails_helper'

RSpec.feature "Deleting posts", type: :feature do
  before do
    signup1
  end

  scenario "User can delete their own post" do
    post_message("Hello, world!")
    click_link("Hello, world!")
    click_button 'Delete'
    expect(page).not_to have_content("Hello, world!")
  end

  scenario "Can view posts newest first" do
    Timecop.freeze(time = Time.now) do
      post_message("Hello, world!")
    end
    post_message("Bye, world!")
    expect(page).to have_content("Bye, world! Posted at: #{time.strftime("%Y-%m-%d %k:%M")}\nHello, world!")
  end
end
