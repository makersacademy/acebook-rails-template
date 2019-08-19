require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }
  it "finds all the posts with a specific wall_id" do
    user1 = User.create(:email => "king@king.com", :encrypted_password => "kingking")
    user2 = User.create(:email => "duke@duke.com", :encrypted_password => "dukeduke")
    Post.create(:message => "the best", :wall_id => user1.id )
    Post.create(:message => "the worst", :wall_id => user2.id )
    expect(Post.get_posts_by_wall_id(user1.id).length).to eq 1
    expect(Post.get_posts_by_wall_id(user1.id)[0].message).to eq "the best"
  end
end
