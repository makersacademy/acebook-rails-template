require 'rails_helper'

feature 'Sign up' do
 scenario 'user can sign up and it is greeted by their name on the page' do
   visit '/'
   fill_in(:user_firstname, with:'Bob')
   fill_in(:user_lastname, with:'Marley')
   fill_in(:user_username, with:'bm')
   fill_in(:user_email, with:'bob@bobmarley.com')
   fill_in(:user_password, with:'bobbob')
   click_button 'Sign up'
   # expect(page).to have_content ('Hello Bob')
 end

 scenario 'user cannot sign up if the username is already in use' do
   visit '/'
   fill_in(:user_firstname, with:'John')
   fill_in(:user_lastname, with:'Lennon')
   fill_in(:user_username, with:'bm')
   fill_in(:user_email, with:'John@Lennon.com')
   fill_in(:user_password, with:'jonjon')
   click_button 'Sign up'
   expect(page).to have_content('Username and E-mail must be unique, please try again')
 end
end
