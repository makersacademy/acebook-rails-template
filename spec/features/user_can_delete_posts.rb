feature 'deleting own posts' do
    scenario 'users can delete their own posts' do
        visit('/users/sign_up')
        fill_in('Name', with: 'Testy')
        fill_in('Surname', with: 'Testerson')
        fill_in('Email', with: 'test@test.com')
        fill_in('Password', with: 'Password123')
        fill_in('Password confirmation', with: 'Password123')
        click_button('Sign up')
    
        click_link('New post')
        fill_in('Message', with: 'test post')
        click_button('Submit')
        expect(page).to have_content('test post')
    
        click_button('delete')
        fill_in('post', with: 'new post')
        click_button('Submit')
    
        expect(page).not_to have_content('new post')
    end
end