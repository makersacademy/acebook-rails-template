feature 'comments' do
  scenario 'user can comment on post' do
    login_and_make_post
    click_link 'Comments'
    fill_in('comment_body', with: 'It sure is!')
    click_button 'Comment'

    expect(current_path).to eq('/posts/1')
    expect(page).to have_content('It sure is!')
  end
end
