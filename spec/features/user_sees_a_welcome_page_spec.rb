require 'rails_helper'

RSpec.feature 'Welcome', type: :feature do
  scenario 'User is welcomed on the idex page' do
    visit '/'
    expect(page).to have_content 'Please Register or Login'
  end
end
