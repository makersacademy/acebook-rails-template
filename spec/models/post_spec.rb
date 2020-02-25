# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do

  post = Post.create(id: 1, message: 'test', created_at: '2019-11-13 11:05:00.470532', user_id: 1, wall_id: 1)

  it { is_expected.to be }

  describe '#can_destroy?' do
    it 'returns true if a post can be destroyed' do
      expect(post.can_destroy?).to eq post
    end
  end

  describe '#not_editable?' do
    it 'returns true edit function has timed out' do
      expect(post.not_editable?).to eq true
    end
  end
end
