require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe HomeHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"
end

def signup 
  visit('/')
  click_link('Sign up')
  fill_in 'Name', with: 'Amoeba'
  fill_in 'Email', with: 'amoeba@boyz.com'
  fill_in 'Password', with: 'amoeba123'
  fill_in 'Password confirmation', with: 'amoeba123'
  click_button 'Sign up'
end 
