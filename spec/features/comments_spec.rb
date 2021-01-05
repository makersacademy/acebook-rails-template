feature 'comments' do
  scenario 'user can comment on post' do
    login_and_make_post
    fill_in('comment_body', with: 'It sure is!')
    click_button 'Comment'

    expect(current_path).to eq('/posts')
    click_link 'Comments'
    expect(page).to have_content('It sure is!')
  end
end
