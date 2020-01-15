require 'rails_helper'

RSpec.feature "sign in" do
  scenario "it redirects to users wall" do
    sign_up
    click_on 'Sign out'
    sign_in("dbacall@hotmail.co.uk", "password")
    expect(page).to have_content("David's Wall")
  end
end
