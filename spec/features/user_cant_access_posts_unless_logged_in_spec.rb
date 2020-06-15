require 'rails_helper'

feature 'test cannot access posts' do
  scenario "Can't access posts/index" do
    visit '/posts/index'

    expect(page).to have_button('Sign Up')
  end
end
