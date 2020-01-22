require 'rails_helper'

RSpec.feature "Redirect to home" do
  scenario "it redirects to homepage if not signed in" do
    visit '/posts'
   
    expect(page.current_path).to eq('/')
  end

  scenario "it redirects to homepage if not signed in" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
    user_1_id = User.all.first.id
    click_on 'Sign out'

    visit "/#{user_1_id}"

    expect(page.current_path).to eq('/')
  end
end
