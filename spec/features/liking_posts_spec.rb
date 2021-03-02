feature 'liking posts' do

  before do
    sign_up(email: 'test@test.com', password: 'password')
    create_a_new_post_and_see_it_on_the_feed('Great post')
  end

  context 'when you click like button' do
    scenario 'number of likes starts at 0' do
      expect(first('.post')).to have_content '0 Likes'
    end
    scenario 'clicking like increments number of likes' do
      first('.post').click_button('Like')
      expect(first('.post')).to have_content '1 Like'
    end
  end

end
