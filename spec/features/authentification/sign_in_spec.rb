require 'rails_helper'

RSpec.feature "sign in" do
  scenario "it redirects to users wall" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
    click_on 'Sign out'
    sign_in('harry_mumford@hotmail.co.uk', 'password')
    user_id = User.all.first.id
    expect(page.current_path).to eq "/#{user_id}"
  end

  scenario "it gives an error if password wrong" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
    click_on 'Sign out'
    sign_in("harry_mumford@hotmail.co.uk", "passwor")
    expect(page).to have_content("Bad email or password")
  end
end
