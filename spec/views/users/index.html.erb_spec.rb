RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(email: 'a@gmail.com', password: 'password'),
             User.create!(email: 'b@gmail.com', password: 'password')
           ])
  end

  it 'renders a list of users' do
    render
  end
end
