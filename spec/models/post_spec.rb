require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.new(message: 'Hello, world', created_at: '2019-12-12 11:53:11.7426', updated_at: '2019-12-12 11:53:11.7426') }

  describe '#parse_date' do
    it 'returns Thursday at 11:53 when called on a post that was created on Thursday at 11:53' do
      expect(post.parse_date).to eq 'Thursday at 11:53'
    end
  end
end
