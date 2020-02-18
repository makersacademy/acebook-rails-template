# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#under_ten_mins' do
    it 'should return false if post created more than 10 mins ago' do 
      post = Post.new({:message => 'Hello world', :created_at => Time.now})#, created_at: nil, updated_at: nil, user_id: nil, wall_id: nil})
      p post
      Timecop.travel(Time.now + 11.minutes) do
        expect(subject.under_ten_mins(post)).to eq false
      end
    end

    it 'should return true if post created less than 10 mins ago' do 
      post = Post.new({:message => 'Hello world', :created_at => Time.now})
      expect(subject.under_ten_mins(post)).to eq true
    end 
  end
end
