# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do

  context "user wall shows posts" do

    before(:each) do
      @user = User.create({:email => "example@example.com", :password => "example"})
    end

    it 'where user.id and wall_id' do
      post_1 = @user.posts.create({:message => "Meow", :wall_id => @user.id})
      post_2 = @user.posts.create({:message => "CatsRule", :wall_id => @user.id})
      post_3 = @user.posts.create({:message => "DogsDrool", :wall_id => 0})
      expect(User.filter(User.all, @user)).to eq [post_1, post_2]
    end

    it "by reverse chronological order" do
      post = @user.posts.create({:message => "Meow"})
      Timecop.travel(Time.now + 2.minutes) do
        new_post = @user.posts.create({:message => "I'm new"})
        expect(User.reverse_posts(@user.posts)).to eq([new_post, post])
      end
    end

  end

end
