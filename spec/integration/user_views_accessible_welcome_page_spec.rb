require 'spec_helper'

feature 'people', js: true do
  scenario 'index is accessible' do
    visit 'http://localhost:3000/people/sign_in'
    expect(page).to be_accessible
  end
end
