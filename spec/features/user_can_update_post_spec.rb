feature 'updating own posts' do

  scenario 'user can update their own posts' do
    sign_up_as_testy
    

    click_link('New post')
    fill_in('Message', with: 'test post')
    click_button('Submit')
    expect(page).to have_content('test post')

    click_button('Update')
    fill_in('post', with: 'new post')
    click_button('Submit')

    expect(page).not_to have_content('test post')
    expect(page).to have_content('new post')
  end
  
  scenario 'user can update their own posts up to 10 minutes'

  scenario "user can't update their own posts after 10 minutes"

  scenario "users can't edit other peoples posts" do
    sign_up_as_testy

    click_link('New post')
    fill_in('Message', with: 'test post')
    click_button('Submit')
    expect(page).to have_content('test post')

    click_link('Sign out')

    sign_up_as_specy

    expect(page).not_to have_button "Update"
  end
end
