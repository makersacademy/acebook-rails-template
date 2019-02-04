require 'rails_helper'

RSpec.feature "Writing posts", type: :feature do


  let(:email){'bea_courage@hotmail.co.uk'}
  let(:password){'testingisfunlol'}


  scenario "Can submit posts and view them" do
    sign_up(email, password)
    click_on 'Logout'
    log_in(email, password)
    expect(page.current_path).to eql('/posts')
    click_link "New post"
    fill_in "Message", with: "What a wonderful post!"
    click_button "Submit"
    expect(page).to have_content("What a wonderful post!")
  end
end
