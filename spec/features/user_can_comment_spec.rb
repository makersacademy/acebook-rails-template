require 'rails_helper'

feature 'comments', type: :feature do

  before do
    sign_up
    create_post
  end

  scenario 'user can comment' do
    visit '/posts'
    click_link 'Comment'
    fill_in 'Body', with: 'new comment'
    click_button 'Submit'
    expect(page).to have_content('new comment')
    expect(page).to have_content(Time.new.strftime('%I:%M %p, %A, %b %d'))
    expect(page).to have_content 'Amy Smith'
  end
end
