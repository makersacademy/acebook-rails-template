require 'rails_helper'

feature 'Sign up' do
 scenario 'user can sign up and it is greeted by their name on the page' do
   visit '/'
   # puts page.body
   fill_in(:user_firstname, with:'Bob')
   fill_in(:user_lastname, with:'Marley')
   fill_in(:user_username, with:'bm')
   fill_in(:user_email, with:'bob@bobmarley.com')
   fill_in(:user_password, with:'bobbob')
   click_button 'Sign up'
   expect(page).to have_content ('Hello Bob')
 end
end
