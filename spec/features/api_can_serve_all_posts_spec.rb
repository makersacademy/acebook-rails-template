# localhost:3000/api/v1/posts

require 'rails_helper'

RSpec.feature "Posts API", type: :feature do
  scenario "Visiting /api/v1/posts returns all posts" do

    Post.create(message:"Hello!", slug:"HelloWorld")
    visit '/api/v1/posts'
    # expect(page).to have_content('"id": 1')
    expect(page).to have_content('"message":"Hello!"')
    expect(page).to have_content('"slug":"HelloWorld"')
  end
end