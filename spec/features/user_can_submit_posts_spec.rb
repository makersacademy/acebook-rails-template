require 'rails_helper'
require 'web_helpers'

RSpec.feature "Timeline", type: :feature do

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.new(id: 1))
  end

  scenario "Can submit posts and view them" do
    submit_post
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can visit the individual post page and view the post and edit/delete buttons" do
    submit_post
    click_link "Hello, world!"
    expect(page).to have_content("Hello, world!")
    page.should have_selector(:link_or_button, 'Delete')
    page.should have_selector(:link_or_button, 'Edit')
  end

end
