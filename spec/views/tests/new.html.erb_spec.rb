require 'rails_helper'

RSpec.describe "tests/new", type: :view do
  before(:each) do
    assign(:test, Test.new(
      :name => "MyString",
      :description => ""
    ))
  end

  it "renders new test form" do
    render

    assert_select "form[action=?][method=?]", tests_path, "post" do

      assert_select "input[name=?]", "test[name]"

      assert_select "input[name=?]", "test[description]"
    end
  end
end
