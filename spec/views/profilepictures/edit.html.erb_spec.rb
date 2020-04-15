require 'rails_helper'

RSpec.describe "profilepictures/edit", type: :view do
  before(:each) do
    @profilepicture = assign(:profilepicture, Profilepicture.create!(
      :caption => "MyText",
      :user => nil
    ))
  end

  it "renders the edit profilepicture form" do
    render

    assert_select "form[action=?][method=?]", profilepicture_path(@profilepicture), "post" do

      assert_select "textarea[name=?]", "profilepicture[caption]"

      assert_select "input[name=?]", "profilepicture[user_id]"
    end
  end
end
