require 'rails_helper'


RSpec.feature 'delete', type: :feature do

  scenario 'user can delete a post' do
    add_a_post
    expect(page).to have_content("Delete")
  end

end
