require 'rails_helper'

RSpec.describe Post, type: :model do

  describe '#time_stamp' do
    it 'returns today and the time of posting if the post posted today' do
      post = Post.new
      allow(post).to receive(:created_at).and_return(DateTime.new(2019,2,3,13,30,0))
      allow(Time).to receive(:now).and_return(DateTime.new(2019,2,3,14,00,0))
      expect(post.time_stamp).to eq("Posted today at 13:30")
    end

    it 'returns the date and time of posting if the post was posted before today' do
      post = Post.new
      allow(post).to receive(:created_at).and_return(DateTime.new(2019,2,3,13,30,0))
      allow(Time).to receive(:now).and_return(DateTime.new(2019,2,5,14,00,0))
      expect(post.time_stamp).to eq("Posted on Sunday 03 Feb at 13:30")
    end
  end

end
