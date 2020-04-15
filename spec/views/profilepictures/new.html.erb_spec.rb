require 'rails_helper'

RSpec.describe "profilepictures/new", type: :view do
  before(:each) do
    assign(:profilepicture, Profilepicture.new(
      :caption => "MyText",
      :user => nil
    ))
  end

  it "renders new profilepicture form" do
    render

    assert_select "form[action=?][method=?]", profilepictures_path, "post" do

      assert_select "textarea[name=?]", "profilepicture[caption]"

      assert_select "input[name=?]", "profilepicture[user_id]"
    end
  end
end
