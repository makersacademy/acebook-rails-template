require 'rails_helper'

RSpec.describe "ideas/edit", type: :view do
  before(:each) do
    @idea = assign(:idea, Idea.create!(
      :name => "MyString",
      :description => "MyText",
      :picture => "MyString"
    ))
  end

  it "renders the edit idea form" do
    render

    assert_select "form[action=?][method=?]", idea_path(@idea), "post" do

      assert_select "input[name=?]", "idea[name]"

      assert_select "textarea[name=?]", "idea[description]"

      assert_select "input[name=?]", "idea[picture]"
    end
  end
end
