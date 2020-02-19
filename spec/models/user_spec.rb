# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  context "shows user posts" do
    it "by reverse chronological order"
      user = User.create({:email => "example@example.com", :password => "example"})
      old_post = user.posts.create({:message => "Meow"})
      Timecop.travel(Time.now + 2.minutes) do
        new_post = user.posts.create({:message => "I'm new"})
        expect(User.reverse_posts(user.posts)).to eq([new_post, old_post])
      end
    end
  end
end
