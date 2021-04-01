require_relative 'web_helpers'

feature 'deleting own posts' do
  scenario 'users can delete their own posts' do
    sign_up_as_testy()

    page.find('#post_message', visible: :all)
    fill_in('post_message', with: 'test post')
    click_button('Submit')

    expect(page).to have_content('test post')

    click_button('Delete')

    expect(page).not_to have_content('test post')
  end

  scenario "users can't delete other peoples posts" do
    sign_up_as_testy

    page.find('#post_message', visible: :all)
    fill_in('post_message', with: 'test post')
    click_button('Submit')
    expect(page).to have_content('test post')

    click_link("sign-out-button")

    sign_up_as_specy

  
    expect(page).not_to have_button('Delete')
  end
end
