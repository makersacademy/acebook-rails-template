require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  describe '#log_in' do
    it 'assigns user_id to session user_id' do
      user = User.new(first_name: 'Bob', last_name: 'Bear', email: 'bob@bear.com', password: 'bobby')
      log_in(user)
      expect(session[:user_id]).to eq user.id
    end
  end
end
