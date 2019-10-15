require 'rails_helper'

RSpec.describe "profile_pictures/show", type: :view do
  before(:each) do
    @profile_picture = assign(:profile_picture, ProfilePicture.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
