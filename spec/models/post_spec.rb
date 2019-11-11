# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do

  post = Post.create

  it { is_expected.to be }

  describe '#can_destroy?' do
    it 'returns true if a post can be destroyed' do
      expect(post.can_destroy?).to eq post
    end
  end

  describe '#not_editable?' do
    # NEED TO SPEAK TO COACH ABOUT THESE TESTS 
    it 'returns true edit function has timed out' do
      pending
      expect(post.not_editable?).to eq nil
    end

    it 'directs to posts_url' do
      pending
      expect(post.not_editable?).to redirect_to(posts_url)
    end
  end
end
