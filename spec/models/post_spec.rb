require 'rails_helper'

RSpec.describe Post, type: :model do
  it "create new post" do
    post = Post.new(course_id: 1, title: "Hello", content: "World")
    expect(post).to be_valid
  end

  it "is not valid without a course" do
    post = Post.new(title: "Hello", content: "World")
    expect(post).not_to be_valid
  end

  it "is not valid without a title" do
    post = Post.new(course_id: 1, content: "World")
    expect(post).not_to be_valid
  end

  it "is not valid without content" do
    post = Post.new(course_id: 1, title: "Hello")
    expect(post).not_to be_valid
  end
end
