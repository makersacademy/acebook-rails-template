require 'rails_helper'

# RSpec.describe HomeHelper, type: :helper do
#  pending "add some examples to (or delete) #{__FILE__}"
# end

def signup
 visit('/')
 click_link('Sign up')
 fill_in 'Name', with: 'Amoeba'
 fill_in 'Email', with: 'amoeba@boyz.com'
 fill_in 'Password', with: 'amoeba123'
 fill_in 'Password confirmation', with: 'amoeba123'
 click_button 'Sign up'
end

def signup2
 visit('/')
 click_link('Sign up')
 fill_in 'Name', with: 'Amoeba2'
 fill_in 'Email', with: 'amoeba2@boyz.com'
 fill_in 'Password', with: 'amoeba123'
 fill_in 'Password confirmation', with: 'amoeba123'
 click_button 'Sign up'
end

def signup3
 visit('/')
 click_link('Sign up')
 fill_in 'Name', with: 'Chris'
 fill_in 'Email', with: 'calves@boyz.com'
 fill_in 'Password', with: 'amoeba123'
 fill_in 'Password confirmation', with: 'amoeba123'
 click_button 'Sign up'
end
