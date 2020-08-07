require 'rails_helper'

RSpec.describe 'people/index', type: :view do
  before(:each) do
    assign(:people, [
             Person.create!(
               email: 'jimji@jimji.com',
               password: 'Password'
             ),
             Person.create!(
               email: 'jimji1@jimji.com',
               password: 'Password'
             )
           ])
  end

  it 'renders a list of people' do
    render
    assert_select 'tr>td', text: /jimji/, count: 2
    assert_select 'tr>td', text: 'Password'.to_s, count: 2
  end
end
