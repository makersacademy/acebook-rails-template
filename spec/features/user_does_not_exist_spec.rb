require 'rails_helper'


RSpec.feature "Custom 404 page", type: :feature do

    scenario "Logged in user goes to non-existent users' page" do
      signup_as_new_user('jess')
      login_as_user('jess')
      visit '/users/1000'
      expect(page).to have_content "This user does not exist(404)"

    end
end
