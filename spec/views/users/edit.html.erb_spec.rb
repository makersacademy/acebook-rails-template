RSpec.describe 'users/edit', type: :view do
  before(:each) do
    @user = User.create!(email: 'a@gmail.com', password: 'password')
  end

  it 'renders the edit user form' do
    render

    assert_select 'form[action=?][method=?]', user_path(@user), 'post' do
    end
  end
end
