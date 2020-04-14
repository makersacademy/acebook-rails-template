require 'rails_helper'

RSpec.describe "images/new", type: :view do
  before(:each) do
    assign(:image, Image.new(
      :caption => "MyText",
      :user => nil
    ))
  end

  it "renders new image form" do
    render

    assert_select "form[action=?][method=?]", images_path, "post" do

      assert_select "textarea[name=?]", "image[caption]"

      assert_select "input[name=?]", "image[user_id]"
    end
  end
end
