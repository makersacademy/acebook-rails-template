# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }
  describe 'format_time' do
    it "converts a date from db into 'dd/mm/yyyy hh:mm' format" do
      time = Time.new(2019, 0o4, 29, 2, 2, 2)
      expect(Post.format_time(time)).to eq('29/04/2019 02:02')
    end
  end

  describe 'allow_update?' do
    it 'returns true if time difference between post creation and now is <= 10 mins' do
      user = User.create(email: 'beefy@beefmaster.com', password: 'suckurnan')
      post = Post.create(message: 'Test message', user_id: 1)
      travel(601)
      expect(post.allow_update?).to eq false
    end
    it 'returns false if time difference between post creation and now is > 10 mins' do
      user = User.create(email: 'beefy@beefmaster.com', password: 'suckurnan')
      post = Post.create(message: 'Test message', user_id: 1)
      travel(599)
      expect(post.allow_update?).to eq true
    end
  end
end
