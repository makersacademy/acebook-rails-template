feature 'Delete own posts' do
  scenario 'Post can only be deleted by owner' do
    signup
    newpost
    signup
    visit"/posts"
    expect(page).not_to have_button("Remove")
  end
end
