require 'rails_helper'

RSpec.describe "ideas/show", type: :view do
  before(:each) do
    @idea = assign(:idea, Idea.create!(
      :name => "Name",
      :description => "MyText",
      :picture => "Picture"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Picture/)
  end
end
