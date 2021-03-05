require 'rails_helper'
require 'web_helpers'


RSpec.feature 'Timeline', type: :feature do
  scenario 'Can like a post' do
    sign_up
    create_post
    
    
    expect(page).to have_content(DEFAULT_POST)
  end

  
end
