# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do

  describe '#show' do
    it 'should show posts where wall id is nil' do
      @user = User.create({:email => "example@example.com", :password => "example"})
      post = @user.posts.create({:message => 'Hello world', :wall_id => nil})
      expect(Post.show).to eq [post]
    end
  end

  describe '#under_ten_mins' do
    post = Post.new({:message => 'Hello world', :created_at => Time.now})
    
    it 'should return false if post created > 10 mins ago' do
      Timecop.travel(Time.now + 11.minutes) do
        expect(Post.under_ten_mins(post)).to eq false
      end
    end

    it 'should return true if post created < 10 mins ago' do
      expect(Post.under_ten_mins(post)).to eq true
    end
  end
end
