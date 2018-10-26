require 'rails_helper'

RSpec.describe "image_posts/show", type: :view do
  before(:each) do
    @image_post = assign(:image_post, ImagePost.create!(
      :caption => "Caption",
      :picture => "Picture"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Caption/)
    expect(rendered).to match(/Picture/)
  end
end
