require 'rails_helper'

  RSpec.feature 'Adding comments to a post', type: :feature do
    scenario 'User creates a post and adds a comment' do
      create_comment
      expect(page).to have_content('I love cheese')
    end
  end
