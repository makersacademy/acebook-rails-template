require 'rails_helper'
RSpec.feature 'Posts can have new lines' do
  scenario 'posts contain multiple lines' do
    sign_up
    click_on 'New Post'
    fill_in 'Message', with: "Blah\r\nblah\r\nblah"
    click_on 'Create Post'
    # save_and_open_page
    # binding.pry
    # page.find(:xpath, "//br")
    # p page.source
    expect(page.source).to include("Blah\r <br>\n            blah\r <br>\n            blah <br>")
  end
end
