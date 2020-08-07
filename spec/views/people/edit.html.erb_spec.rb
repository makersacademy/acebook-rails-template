require 'rails_helper'

RSpec.describe 'people/edit', type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
                                email: 'jimji@jimji.co.uk',
                                password: 'password123'
                              ))
  end

  it 'renders the edit person form' do
    render

    assert_select 'form[action=?][method=?]', person_path(@person), 'post' do
      assert_select 'input[name=?]', 'person[email]'

      assert_select 'input[name=?]', 'person[password]'
    end
  end
end
