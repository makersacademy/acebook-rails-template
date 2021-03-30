feature 'liking posts' do
  xscenario 'posts can be liked' do
    sign_up_as_testy

    click_link 'New post'
    fill_in 'Message', with: 'This post is likeable'
    click_button 'Submit'

    expect(page).to have_content('This post is likeable')
    expect(page).to have_selector('#like-count', text: '0')
    expect(Post.first.likes.count).to be(0)

    click_button('👍')

    expect(Post.first.likes.count).to be(1)
    expect(page).to have_selector('#like-count', text: '1')
  end
end
