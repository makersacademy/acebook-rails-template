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
