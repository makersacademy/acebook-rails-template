require 'rails_helper'
require_relative 'add_a_post_helper'

RSpec.feature 'edit post', type: :feature do
  scenario 'user can edit his posts' do
    add_a_post
    expect(page).to have_link('Edit')
  end

  scenario 'user can see the edited post' do
    add_a_post
    click_link "Edit"
    fill_in "post[message]", :with => 'editted message'
    click_button "Submit"
    expect(page).to have_content 'editted message'
  end

end
