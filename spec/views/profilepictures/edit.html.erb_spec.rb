require 'rails_helper'

RSpec.describe "profilepictures/edit", type: :view do
  before(:each) do
    user = User.create(name: "stephan", dob: '2020-04-04', cob: 'south africa', mob: 112, email: 'stephan@test.com', password: "password")
    @profilepicture = assign(:profilepicture, Profilepicture.create!(
      :caption => "MyText",
      :user => user
    ))
  end

  it "renders the edit profilepicture form" do
    render

    assert_select "form[action=?][method=?]", profilepicture_path(@profilepicture), "post" do

      assert_select "textarea", "MyText"
    end
  end
end
