RSpec.describe 'sessions/new.html.erb', type: :view do
  it 'renders new user form' do
    render

    assert_select 'form[action=?][method=?]', '/login', 'post' do
    end
  end
end
