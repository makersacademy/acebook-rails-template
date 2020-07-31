require 'rails_helper'

RSpec.describe "users/new.html.erb", type: :view do
  it 'renders a form with a user email and password text field' do
  expect(rendered).to have_field('user[email]')
  expect(rendered).to have_field('user[password]')
  expect(rendered).to have_button('Save User')
  end
end