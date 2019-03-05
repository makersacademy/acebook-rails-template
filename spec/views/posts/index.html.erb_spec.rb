require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(user_id: User.first.id, message: 'Hello Anne'),
      Post.create!(user_id: User.first.id, message: 'Hello Bill')
    ])
  end

  it "renders a list of posts" do
    render
  end
end
