describe 'updating posts' do
  let!(:post_writer) { User.create(email: 'update@example.com', password: 'testtest') }
  let!(:wall_owner) { User.create(email: 'owner@example.com', password: 'testtest') }
  let!(:post) do
    Post.create(message: 'Updating this post', user_id: post_writer.id, wall_id: wall_owner.id)
  end 
    
  before do
    visit '/users/sign_in'
    fill_in 'Email', with: post_writer.email
    fill_in 'Password', with: post_writer.password
    click_button 'Log in'
  end

  it 'displays an update button' do
    visit "/#{wall_owner.id}"
    expect(page).to have_button "Update"
  end
end
