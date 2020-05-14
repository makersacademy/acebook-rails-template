require 'rails_helper'

RSpec.feature "Posts API", type: :feature do
  scenario "Visiting /api/v1/posts?message=Hello&slug=HelloWorldreturns all posts" do

    page.driver.post('/api/v1/posts?message=Hello') 
    expect(page).to have_content('"message":"Hello"')
  end
end
