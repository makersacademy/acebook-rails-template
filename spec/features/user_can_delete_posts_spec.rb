require_relative 'web_helpers'

feature 'deleting own posts' do
  scenario 'users can delete their own posts' do
    sign_up_as_testy()

    click_link('New post')
    fill_in('Message', with: 'test post')
    click_button('Submit')

    expect(page).to have_content('test post')

    click_button('Delete')

    expect(page).not_to have_content('test post')
  end

  xscenario "users can't delete other peoples posts" do
    sign_up_as_testy

    click_link('New post')
    fill_in('Message', with: 'test post')
    click_button('Submit')
    expect(page).to have_content('test post')

    click_button('Sign out')

    sign_up_as_specy

    click_button('Delete')
    expect(page).to have_content "Oops, that's not your post!"
    expect(page).to have_content('test post')
  end
end
