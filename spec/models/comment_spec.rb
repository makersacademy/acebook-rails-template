require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#under_ten_mins' do
  comment = Comment.new({:body => 'Cool Comment', :created_at => Time.now})
    
    it 'should return false if comment created > 10 mins ago' do
      Timecop.travel(Time.now + 11.minutes) do
        expect(Comment.under_ten_mins(comment)).to eq false
      end
    end

    it 'should return true if comment created < 10 mins ago' do
      expect(Comment.under_ten_mins(comment)).to eq true
    end
  end
end
