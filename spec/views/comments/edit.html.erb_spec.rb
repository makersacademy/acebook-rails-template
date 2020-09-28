require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      comment: "MyString",
      user: nil,
      post: nil
    ))
  end
end
