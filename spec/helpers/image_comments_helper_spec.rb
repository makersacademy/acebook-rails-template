# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ImagePostsHelper. For example:
#
# describe ImagePostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ImageCommentsHelper, type: :helper do
  describe '#find_image_comment_email' do
    it 'gets the correct email for a given image comment' do
      user = User.create(email: 'testabc123@mail.com', password: 'password')
      expected_email = 'testabc123@mail.com'
      expect(helper.find_image_comment_email(user.id)).to eq expected_email
    end
  end
end
