require 'rails_helper'

RSpec.feature "User cannot visit any page unless logged in" do
  scenario "Not signed-up users can't see any page except the login page" do
    user = User.create(name: 'matt', email:'mdwareing@gmail.com', password: 'test12345')
    visit new_user_post_path(user)
    
    expect(page.current_path).to eq signup_url
  end
end
