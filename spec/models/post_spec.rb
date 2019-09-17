require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#Can_edit?' do
    it 'Checks if a post can be edited' do
      current_time = Time.now.utc
      current_time_plus11 = Time.now + 660
      post = Post.new(created_at: current_time)
      allow(Time).to receive(:now).and_return(current_time_plus11)
      expect(post.can_edit?).to be false
    end
  end

  describe '#lines' do
    it 'returns an array of the lines in a posts message' do
      post = Post.new(message: "Hello\r\nWorld")
      expect(post.lines).to eq ["Hello", "World"]
    end
  end
end
