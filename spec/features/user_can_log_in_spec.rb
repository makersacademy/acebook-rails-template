require 'rails_helper'

RSpec.feature 'User log in' do
  scenario 'log in button on root page' do
    visit '/'
    expect(page).to have_link('Log in')
  end
  scenario 'log in form on log in' do
    visit '/'
    click_link('Log in')
    expect(page).to have_field('session[email]')
    expect(page).to have_field('session[password]')
  end
end
