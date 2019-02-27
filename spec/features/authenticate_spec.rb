require_relative '../helpers/web_helper.rb'

RSpec.context "Authentication: ", type: :feature do
  scenario "When a user has not signed up if they visit another URL, they are redirected to the sign in page" do
    visit '/posts/index'
    expect(current_path).to eq("/users/sign_in")
  end
end
