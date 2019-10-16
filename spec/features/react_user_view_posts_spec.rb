require 'rails_helper'

RSpec.feature "React", type: :feature do
  xscenario "React can see posts " do
    visit "http://localhost:2000/posts"
    save_and_open_page
    expect(page).to have_content "post 1"
  end
end