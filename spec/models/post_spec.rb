# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#under_ten_mins' do
  post = Post.new({:message => 'Hello world', :created_at => Time.now})
    
    it 'should return false if post created > 10 mins ago' do
      Timecop.travel(Time.now + 11.minutes) do
        expect(subject.under_ten_mins(post)).to eq false
      end
    end

    it 'should return true if post created < 10 mins ago' do
      expect(subject.under_ten_mins(post)).to eq true
    end
  end
end
