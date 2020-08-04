require 'rails_helper'

RSpec.describe 'people/show', type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
                                email: 'jimji@jimji.com',
                                password: 'Password123'
                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
  end
end
