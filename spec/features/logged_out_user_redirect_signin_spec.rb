require 'rails_helper'

RSpec.feature 'Redirect visitor', type: :feature do
  scenario 'From posts/index to signin page' do
    visit('/posts')
    expect(current_path).to eq('/')
  end
end