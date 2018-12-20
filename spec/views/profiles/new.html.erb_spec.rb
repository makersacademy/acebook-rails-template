require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new())
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do
    end
  end
end
