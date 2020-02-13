require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(email: 'a@gmail.com'),
             User.create!(email: 'b@gmail.com')
           ])
  end

  it 'renders a list of users' do
    render
  end
end
