require 'rails_helper'

RSpec.describe "avatars/show", type: :view do
  before(:each) do
    @avatar = assign(:avatar, Avatar.create!(
      :username => "Username",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Image/)
  end
end
