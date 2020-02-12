feature "Show all posts on page" do
  scenario "user logs in and see's all posts" do
    sign_up
    create_post
    click_link 'home'
    expect(page).to have_content('test message')
    expect(page).to have_current_path('/posts')
  end
end