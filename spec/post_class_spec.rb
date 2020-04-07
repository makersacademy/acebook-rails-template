require 'post.rb'
describe Post do

  describe "#create" do
    it 'Can create a new post/message' do
      post = Post.create(poster_id: "1", content: "Hello There", time: "14:36")
      expect(post.poster_id).to eq '1'
      expect(post.content).to eq 'Hello There'
      expect(post.time).to eq '14:36'
    end
  end
end