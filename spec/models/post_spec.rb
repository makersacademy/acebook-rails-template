require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  describe '.formatted_message' do
    it 'Retreives the message from the database and replaces line breaks with <br> tags.' do
      User.create(id: 1, username: 'ds.danielh', full_name: 'Dan Holmes', password: 'hunter2', email: 'dan@makers.com' )
      Post.create(id: 1, message: "Line 1\nLine 2", user_id: 1)
      expect(Post.find(1).formatted_message).to eq 'Line 1<br/>Line 2'
    end
  end

  describe '.is_less_than_ten_minutes_old?' do
    it 'Returns false if a message is greater than 10 minutes old' do
      User.create(id: 1, username: 'ds.danielh', full_name: 'Dan Holmes', password: 'hunter2', email: 'dan@makers.com' )
      post = Post.create(id: 1, message: "Line 1\nLine 2", created_at: DateTime.now() - 10.minutes, user_id: 1)
      expect(post.is_less_than_ten_minutes_old?).to eq false
    end

    it 'Returns true if a message is less than 10 minutes old' do  
      User.create(id: 1, username: 'ds.danielh', full_name: 'Dan Holmes', password: 'hunter2', email: 'dan@makers.com' )
      post = Post.create(id: 1, message: "Line 1\nLine 2", user_id: 1)
      expect(post.is_less_than_ten_minutes_old?).to eq true
    end
  end
end
