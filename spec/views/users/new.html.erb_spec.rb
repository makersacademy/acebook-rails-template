require 'rails_helper'

RSpec.describe "users/new.html.erb", type: :view do
  
  before do
    @user = User.new
    render
  end

  it 'renders a form with a user email and password text field' do
    expect(rendered).to have_field('user_email')
    expect(rendered).to have_field('user_password')
    expect(rendered).to have_button('Create User')
  end

end
