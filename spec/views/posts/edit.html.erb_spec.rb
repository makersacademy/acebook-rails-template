RSpec.describe 'posts/edit', type: :view do
  before(:each) do
    user = User.create!(email: 'test@abc.com', password: 'password')
    @post = assign(:post, Post.create!(user_id: user.id, post_content: 'test message'))
  end

  it 'renders the edit post form' do
    render
    assert_select 'form[action=?][method=?]', post_path(@post), 'post' do
    end
  end
end
