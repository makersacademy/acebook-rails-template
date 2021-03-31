feature 'profile photos' do
  xscenario 'a user can upload a profile photo' do
    sign_up_as_testy

    click_link('Edit Profile')
    attach_file('avatar', 'spec/images/profile_photo.png')
    fill_in('Password', with: 'Password12')
    click_button('Update')

    click_link('New post')
    fill_in('Message', with: 'Testing!')
    click_button('Submit')
    expect(first('.post')).to have_selector('img')
  end
end

#
#     expect(page).to have_css('img[src*="llama.jpeg"]')
#     expect(page).to have_content('Llama')
#     expect(current_path).to eq('/posts')
#   end
