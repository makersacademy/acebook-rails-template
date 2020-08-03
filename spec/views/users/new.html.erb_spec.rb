require 'rails_helper'

RSpec.describe "users/new.html.erb", type: :view do
  it 'renders a form with a user email and password text field' do
  expect(rendered).to have_field('user[email]')
  expect(rendered).to have_field('user[password]')
  expect(rendered).to have_button('Save User')
  end

  # it 'creates an alert pop up when the email we put in is not ' do
  #
  # end
  #
  # go to users/new
  # fill in text_field :email
  # expect content () to show
  #
  # go to users/new
  # fill in password_field :password
  # expect content () to show

end
