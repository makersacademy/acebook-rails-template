require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(user_id: User.first.id, message: 'Hello last user', wall: User.last.id),
      Post.create!(user_id: User.last.id, message: 'Hello first user', wall: User.first.id)
    ])
  end

  it "renders a list of posts" do
    allow(view).to receive(:current_user).and_return(User.first)
    render
  end
end
