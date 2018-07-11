require 'rails_helper'

RSpec.describe LikesController, type: :controller do

    describe "#liked_by" do
      it "Proves posts can be liked" do
        johnny = User.create(name: 'johnny', email: 'j@gmail.com', password: 'johnny')
        hello = johnny.posts.create(message: 'hello johnny')
        hello.save
        hello.liked_by johnny
        expect(hello.votes_for.size).to eq(1)
      end
    end
end
