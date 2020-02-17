RSpec.describe 'posts/new', type: :view do
  before(:each) do
    @user = User.create!(email: 'test@abc.com', password: 'password')
    @post = assign(:post, @user.posts.create!(user_id: @user.id, post_content: 'test message'))
  end

  it 'renders new post form' do
    render
    assert_select 'form[action=?][method=?]', user_posts_path(@user.id), 'post' do
    end
  end
end
