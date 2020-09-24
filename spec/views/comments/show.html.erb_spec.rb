require 'rails_helper'

RSpec.describe "comments/show", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      comment: "Comment",
      user: nil,
      post: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Comment/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
