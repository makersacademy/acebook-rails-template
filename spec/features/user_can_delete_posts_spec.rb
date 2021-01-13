describe 'Deleting a post' do
  let!(:post_writer) { User.create(email: 'test@example.com', password: 'testpass') }
  let!(:wall_owner) { User.create(email: 'test2@example.com', password: 'testpass') }
  let!(:post) do
    Post.create(message: 'Test message', user_id: post_writer.id, wall_id: wall_owner.id)
  end
  let!(:post_by_wall_owner) do
    Post.create(message: 'This is my wall,get out', user_id: wall_owner.id, wall_id: wall_owner.id)
  end

  before do
    visit('/users/sign_in')
    fill_in 'Email', with: post_writer.email
    fill_in 'Password', with: post_writer.password
    click_button 'Log in'
  end

  it 'displays a delete button with every post' do
    visit("/#{wall_owner.id}")
    expect(page).to have_button('Delete')
  end

  it 'can delete a post' do
    visit("/#{wall_owner.id}")
    click_button 'Delete'
    expect(page).to have_current_path "/#{wall_owner.id}", ignore_query: true
    expect(page).not_to have_content(post.message)
  end

  it 'Can only delete a post that it wrote' do
    visit("/#{wall_owner.id}")
    post_by_other_user = find("##{post_by_wall_owner.id}")
    post_by_current_user = find("##{post.id}")
    expect(post_by_other_user).not_to have_button 'Delete'
    expect(post_by_current_user).to have_button 'Delete'
  end
end
