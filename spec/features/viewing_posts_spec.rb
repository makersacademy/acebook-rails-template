feature 'viewing posts' do
  scenario 'posts appear newest first' do
    sign_up_as_testy

    click_link 'New post'
    fill_in 'Message', with: 'Test post 1!'
    click_button 'Submit'

    click_link 'New post'
    fill_in 'Message', with: 'Test post 2!'
    click_button 'Submit'

    expect(first('.post')).to have_content('Test post 2!')
    expect(first('.post')).not_to have_content('Test post 1!')
    expect(page).to have_content('Test post 1!')
  end
end
