require 'rails_helper'

RSpec.feature "sign up", type: :feature do
  scenario 'allows user to create account' do
    visit '/'
    fill_in(:name, with: 'Example Name')
    fill_in(:email, with: 'example@gmail.com')
    fill_in(:password, with: 'examplepassword')
    click_button 'Sign up'
    expect(page).to have_content 'Example Name'
  end
end



# RSpec.feature "Timeline", type: :feature do
#   scenario "Can submit posts and view them" do
#     visit "/posts"
#     click_link "New post"
#     fill_in "Message", with: "Hello, world!"
#     click_button "Submit"
#     expect(page).to have_content("Hello, world!")
#   end
# end
