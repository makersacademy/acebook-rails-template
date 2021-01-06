feature 'comments' do
  xscenario 'user can comment on post' do
    login_and_make_post
    click_link('Commentsx')
    p current_path
    fill_in('body', with: 'It sure is!')
    click_button 'Comment'

    expect(current_path).to eq('/posts/1')
    expect(page).to have_content('It sure is!')
  end
end
