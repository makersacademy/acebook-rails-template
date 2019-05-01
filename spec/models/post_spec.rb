# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  describe '.verify_user' do
    it 'verifies that post creator is current user' do
      user_dbl = double('user', id: 1)
      user_post_dbl = double('post', user_id: 1)
      other_post_dbl = double('post', user_id: 2)
      expect(Post.verify_user(user_dbl, user_post_dbl)).to be(true)
      expect(Post.verify_user(user_dbl, other_post_dbl)).to be(false)
    end
  end
end
