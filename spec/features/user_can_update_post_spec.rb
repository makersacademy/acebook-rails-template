feature 'updating own posts' do

  scenario 'user can update their own posts' do
    sign_up_as_testy

    click_link('New post')
    fill_in('Message', with: 'test post')
    click_button('Submit')
    expect(page).to have_content('test post')

    click_button('update')
    fill_in('post', with: 'new post')
    click_button('Submit')

    expect(page).not_to have_content('test post')
    expect(page).to have_content('new post')
  end
  
  scenario 'user can update their own posts up to 10 minutes'

  scenario "users can't edit other peoples posts" do
    sign_up_as_testy

    click_link('New post')
    fill_in('Message', with: 'test post')
    click_button('Submit')
    expect(page).to have_content('test post')

    click_button('Sign out')

    sign_up_as_specy

    click_button('update')
    expect(page).to have_content "Oops, that's not your post!"
  end
end
