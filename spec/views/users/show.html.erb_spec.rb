require 'rails_helper'

<<<<<<< HEAD

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :email => "Email",
      :username => "Username",
      :password => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password/)
  end

=======
RSpec.describe "users/show.html.erb", type: :view do
  pending "add some examples to (or delete) #{__FILE__}"
>>>>>>> master
end
