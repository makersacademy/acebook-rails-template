require 'rails_helper'

RSpec.feature "Users wall" do
  scenario "users can view other walls if signed in" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
    user_id = User.all.first.id
    click_on 'Sign out'
    
    sign_up('Barry', 'Mumford', 'barry_mumford@hotmail.co.uk', 'password')
    visit("/#{user_id}")
   
    expect(page.current_path).to eq("/#{user_id}")
  end
end