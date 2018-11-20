require 'rails_helper'
require 'web_helpers'

RSpec.feature 'Timeline', type: :feature do

  scenario 'user can delete a post' do
    signup
    create_post
    find("a[id=delete-1]").click
    expect(page).not_to have_content('Hello, world!')
  end

end
