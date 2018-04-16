require 'rails_helper'

RSpec.feature 'Welcome redirects', type: :feature do
  scenario 'when signed in, page redirects to News Deck' do
    sign_up
    visit '/'
    expect(page).to have_content 'News Deck'
  end
end

RSpec.feature 'Welcome redirects', type: :feature do
  scenario 'when signed out, page redirects to sign up page' do
    visit '/'
    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
  end
end

RSpec.feature 'Posts redirects', type: :feature do
  scenario 'when signed out, page redirects to sign up page' do
    visit '/posts'
    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
  end
end
