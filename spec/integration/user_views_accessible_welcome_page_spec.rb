require 'spec_helper'

feature 'welcome', js: true do
  scenario 'index is accessible' do
    visit welcome_index_path
    expect(page).to be_accessible
  end
end