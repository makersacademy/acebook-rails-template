require 'rails_helper'
require 'features_helper'

RSpec.feature "Create_comment", type: :feature do
  scenario "Can delete own post" do
    signup
    login
    create_post
    create_comment
    expect(page).to have_content("I love this post!!!")
  end
end
