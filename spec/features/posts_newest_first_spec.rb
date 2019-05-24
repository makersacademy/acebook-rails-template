# frozen_string_literal: true

require 'rails_helper'

# let!(:first_post) { Factory(:post) }
# let!(:second_post) { Factory(:post) }

RSpec.feature 'Timeline', type: :feature do
  scenario 'posts appear with newest post first' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello!'
    click_button 'Submit'
    click_link 'New post'
    fill_in 'Message', with: 'World!'
    click_button 'Submit'
    expect(page).to have_content('World! Created on', 'Hello! Created on')
    # page.body.index(first_post.text).should < page.body.index(second_post.text
  end
end
