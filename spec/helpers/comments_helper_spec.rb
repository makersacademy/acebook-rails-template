# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CommentsHelper. For example:
#
# describe CommentsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CommentsHelper, type: :helper do
  describe '#get_comment_email' do
    it 'gets the correct email for a given user_id' do
      user = User.create(email: 'testabc123@mail.com', password: 'password')
      expect(helper.get_comment_email(user.id)).to eq 'testabc123@mail.com'
    end
  end
end
