feature 'viewing posts' do
  scenario 'posts appear newest first' do
    sign_up_as_testy

    page.find('#post_message', visible: :all)

    fill_in 'post_message', with: 'Test post 1!'
    click_button 'Submit'

   
    fill_in 'post_message', with: 'Test post 2!'
    click_button 'Submit'

    expect(first('.post')).to have_content('Test post 2!')
    expect(first('.post')).not_to have_content('Test post 1!')
    expect(page).to have_content('Test post 1!')
  end
end
