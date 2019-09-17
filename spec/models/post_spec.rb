require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  describe '#Can_edit?' do
    it 'Checks if a post can be edited' do
      current_time = Time.now.utc
      current_time_plus_11 = Time.now + 660
      post = Post.new(created_at: current_time)
      allow(Time).to receive(:now).and_return(current_time_plus_11)
      expect(post.can_edit?).to be false
    end
  end


end


