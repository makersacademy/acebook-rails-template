RSpec.describe 'users/new', type: :view do
  it 'renders new user form' do
    render

    assert_select 'form[action=?][method=?]', '/signup', 'post' do
    end
  end
end
