require 'rails_helper'

RSpec.describe "profilepictures/show", type: :view do
  before(:each) do
    @profilepicture = assign(:profilepicture, Profilepicture.create!(
      :caption => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
