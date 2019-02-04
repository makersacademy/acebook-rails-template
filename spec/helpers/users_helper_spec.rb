require 'rails_helper'

def fill_in_sign_up_details
  visit '/'
  fill_in :first_name, with: 'Dave'
  fill_in :last_name, with: 'Katze'
  fill_in :email, with: 'davethecat@katze.com'
  fill_in :password, with: 'Gato123'
  fill_in :birthday, with: '2000/10/10'
  fill_in :gender, with: 'Male'
end

def create_user
  tom = User.create(first_name: 'Tom', last_name: 'Lawrence', birthday: '2000-01-01', password: 'nerds123', gender: 'Male', email: 'tom@hotmail.com') 
  session[:user_id] = tom.id
end

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
# RSpec.describe UsersHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
