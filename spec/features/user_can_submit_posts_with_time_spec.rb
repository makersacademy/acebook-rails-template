require 'rails_helper'
require_relative '../helpers/web_helpers'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
    new_post('First post')
    expect(page).to have_content("First post")
  end
end

RSpec.feature "Timestamp", type: :feature do
  scenario "Can see the time the post was made" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
    t = Time.new.strftime("%k:%M") 
    new_post('First post')
    expect(page).to have_content(t)
  end
end
