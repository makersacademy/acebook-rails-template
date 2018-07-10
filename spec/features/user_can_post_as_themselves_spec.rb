require 'rails_helper'

RSpec.feature "User can post as themselves", type: :feature do
  scenario 'successfully' do
    sign_up_successfully
    
    fill_in "post_message", with: "test text"
    click_button 'Post'
    expect(page).to have_content("Millie")
  end
end
