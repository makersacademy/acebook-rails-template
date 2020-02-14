RSpec.describe 'posts/show', type: :view do
  before(:each) do
    user = User.create!(email: 'test@abc.com', password: 'password')
    @post = assign(:post, Post.create!(user_id: user.id, post_content: 'test message'))
  end

  it 'renders attributes in <p>' do
    render
  end
end
