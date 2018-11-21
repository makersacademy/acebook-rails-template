require 'rails_helper'

feature 'Sign up' do
 scenario 'user can sign up and it is greeted by their name on the page' do
   visit '/'
  fill_in(:firstname, with:'Bob')
   fill_in(:lastname, with:'Marley')
   fill_in(:username, with:'bm')
   fill_in(:email, with:'bob@bobmarley.com')
   fill_in(:password, with:'bobbob')
   click_button 'Sign up'
   expect(page).to have_content ('Hello Bob')
 end
end
