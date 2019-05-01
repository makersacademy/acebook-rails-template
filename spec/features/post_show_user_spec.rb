# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts show the user as well as message', type: :feature do
  scenario 'When I post a message, my email is displayed alongside it' do
    sign_up_helper('test@gmail.com', '123')
    log_in_helper('test@gmail.com', '123')
    click_button "New post"
    fill_in "Message", with: "Check out this sweet post!"
    click_button "Submit"
    expect(first(:css, 'div.user').text).to eq 'test@gmail.com'
  end
end
