require 'rails_helper'

RSpec.feature "Posts time shown", type: :feature do
  scenario "All messages show time of creation" do
    sign_up_helper('test@gmail.com', '123')
    log_in_helper('test@gmail.com', '123')
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page.first(:css, "span").text).to match(/^([1-9]|([012][0-9])|(3[01]))\/([0]{0,1}[1-9]|1[012])\/\d\d\d\d\s([0-1]?[0-9]|2?[0-3]):([0-5]\d)$/)
  end
end
