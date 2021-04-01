feature 'liking posts' do
  xscenario 'posts can be liked' do
    sign_up_as_testy

    click_link 'New post'
    fill_in 'Message', with: 'This post is likeable'
    click_button 'Submit'

    expect(page).to have_content('This post is likeable')
    expect(page).to have_selector('.like_count', text: '0')

    find('a.like-btn').click
    expect(page).to have_selector('.like_count', text: '1')
  end
end
