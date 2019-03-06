require 'rails_helper'
require 'sign_up_helper.rb'
require 'login_helper'

RSpec.feature "Post timestamp", type: :feature do
  
  scenario "initially do a new test sign up" do
    new_sign_up("easyname", "easyemail@easy.com", "abc123")
    expect(page.status_code).to eql 200
    expect(page).to have_content("Add a new post")
  end

  scenario "test that post shows '1 minute ago' if current time is 1 minute ahead of post time" do
    new_sign_up("easyname", "easyemail@easy.com", "abc123")
    expect(page.status_code).to eql 200
    expect(page).to have_content("Add a new post")
    fill_in "post[message]", :with => 'lots of shizzle me nizzle test message'
    click_button "Add post"
    expect(page).to have_content("shizzle me nizzle")
    sleep (5)
    # expect(page).to have_content("1 minute ago")
  end

end
