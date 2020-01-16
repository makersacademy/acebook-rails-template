require 'rails_helper'

RSpec.feature "sign in" do
  scenario "it redirects to users wall" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
    click_on 'Sign out'
    sign_in("dbacall@hotmail.co.uk", "password")
    expect(page).to have_content("David's Wall")
  end
end
