require 'rails_helper'
include WelcomeHelper

RSpec.feature 'A user can post an image' do
  scenario 'Posts shows the image if added' do
    sign_up
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    attach_file('post[image]', 'spec/image/download.jpeg')
    click_button 'Submit'
    expect(page).to have_content('created by: username')
    expect(page).to have_css("img[src*='download.jpeg']")
  end
end
